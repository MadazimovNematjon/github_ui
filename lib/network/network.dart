import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../model/user_model.dart';

class Network {
  static String BASE = "api.github.com";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_LIST = "/users/MadazimovNematjon";


  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    }
    return null;
  }



  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }





  /* Http Parsing */
  static List<UserModel> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    if (json is Map<String, dynamic>) {
      return [UserModel.fromJson(json)];
    }
    return [];
  }







}