import 'package:dio/dio.dart';
import 'dart:convert';
import 'api.dart';

class CommunicationWithApi {
  static Dio dio = Dio();

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

