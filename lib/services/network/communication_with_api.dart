import 'package:dio/dio.dart';
import 'dart:convert';
import 'api.dart';

class CommunicationWithApi {
  static Dio dio = Dio();

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

  static Future<Map<String, dynamic>?> update(String api, String id, Map<String, dynamic> data) async {
    String url = "${Api.baseUrl}$api/$id";

    try{
      Response response = await dio.put(url, data: data);
      if([200, 201].contains(response.statusCode)) return response.data;
    } catch(e){
      return null;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> deleteElement(String api, String id) async {
    String url = "${Api.baseUrl}$api/$id";

    try{
      Response response = await dio.delete(url);

      print(response.data);
      if([200, 201].contains(response.statusCode)) return response.data;
    } catch(e){
      return null;
    }

    return null;
  }
}

