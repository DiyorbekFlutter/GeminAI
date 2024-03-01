import 'package:dio/dio.dart';
import 'dart:convert';
import 'api.dart';
import 'package:http/http.dart' as http;

class CommunicationWithApi {
  static Dio dio = Dio();










  static Future sendChatGPTRequest(List<Map<String, dynamic>> messages) async {
    final endpoint = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Api.chatGptApiKey}',
    };

    final body = jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': messages,
    });

    try{
      final http.Response response = await http.post(Uri.parse(endpoint), headers: headers, body: body);

      print("Status Code: ${response.statusCode}");
      if (response.statusCode == 200) return jsonDecode(response.body);
    } catch(e){
      print("Xatolik yuz berdi");
    }
  }










  static Future<String?> postToGemini(String text) async {
    String url = "${Api.baseUrlGoogle}${Api.apiGetGeminiText}?key=${Api.geminiAPiKey}";

    try{
      Response response = await Dio().post(url, data: {"contents": [{"parts": [{"text": text}]}]});

      if([200, 201].contains(response.statusCode)) {
        String resultText = response.data["candidates"][0]["content"]["parts"][0]["text"].replaceAll(RegExp('\n'), '').replaceAll(RegExp('/*'), '');

        String temp = '\t';
        for(int i=0; i<resultText.length; i++){
          if(i%100 == 0){
            while(true){
              if(resultText[i] == ' ') {
                temp += '\n\t';
                i++;
                break;
              } else {
                temp += resultText[i];
                i++;
              }
            }
          }

          temp += resultText[i];
        }

        return temp;
      }
    } catch(e){
      return null;
    }

    return null;
  }

  static Future<List?> getAll(String api) async {
    String url = '${Api.baseUrl}$api';

    try{
      Response response = await dio.get(url);
      if([200, 201].contains(response.statusCode)) return response.data;
    } catch(e){
      return null;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> toPost(String api, Map<String, dynamic> data) async {
    String url = '${Api.baseUrl}$api';

    try{
      Response response = await dio.post(url, data: jsonEncode(data));
      if([200, 201].contains(response.statusCode)) return response.data;
    } catch(e){
      return null;
    }
    return null;
  }

  // static Future<String?> update(String api, String id, Map<String, dynamic> body) async {
  //   Uri url = Uri.http(Api.baseUrl, "$api/$id");
  //
  //   try{
  //     Response response = await put(url, body: jsonEncode(body), headers: {"Content-Type": "application/json"});
  //
  //     if([200, 201].contains(response.statusCode)) return response.body;
  //   } catch(e){
  //     return null;
  //   }
  //
  //   return null;
  // }
  //
  // static Future<String?> deleteElement(String api, String id) async {
  //   Uri url = Uri.https(Api.baseUrl, "$api/$id");
  //
  //   try{
  //     Response response = await delete(url);
  //
  //     if([200, 201].contains(response.statusCode)) return response.body;
  //   } catch(e){
  //     return null;
  //   }
  //
  //   return null;
  // }
}

