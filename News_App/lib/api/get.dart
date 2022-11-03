import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsapi.dart';

import '../program.dart';
class GetApi{

  static Future<NewsApi?> getNewsData(BuildContext context) async {
    try{
      http.Response data = await http.get(Uri.parse("${Program.baseurl}&apikey=${Program.apikey}"),
          headers: {
            'Content--type' : 'application/json',
            'Accept': 'application/json',

          }
      );
      var jsonData = jsonDecode(data.body);
      var newsData = NewsApi.fromJson(jsonData);
      return newsData;
    }
    catch (e){
      // print(e.toString());
      return null;
    }


  }
}