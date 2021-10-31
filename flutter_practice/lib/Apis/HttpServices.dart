import 'package:flutter/material.dart';
import 'package:flutter_practice/Apis/Apis.dart';
import 'package:http/http.dart' as http;

class HttpServices {

  static Future<http.Response?> getPosts() async{
    try{
      var url = Uri.parse(APIS.BASE_URL + APIS.post);
      http.Response response = await http.get(url);
      return response;
    }catch(e){
      debugPrint("getPosts ===> error > ${e.toString()}");
    }
  }

  static Future<http.Response?> getComments() async{
    try{
      var url = Uri.parse(APIS.BASE_URL + APIS.comments);
      http.Response response = await http.get(url);
      debugPrint(response.body);
      return response;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  static Future<http.Response?> getPhotos() async{
    try{
      var url = Uri.parse(APIS.BASE_URL + APIS.photos);
      http.Response response = await http.get(url);
      debugPrint(response.body);
      return response;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  static Future<http.Response?> getAlbums() async{
    try{
      var url = Uri.parse(APIS.BASE_URL + APIS.albums);
      http.Response response = await http.get(url);
      debugPrint(response.body);
      return response;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  static Future<http.Response?> getUsers() async{
    try{
      var url = Uri.parse(APIS.BASE_URL + APIS.users);
      http.Response response = await http.get(url);
      debugPrint(response.body);
      return response;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  static Future<http.Response?> getTodos() async{
    try{
      var url = Uri.parse(APIS.BASE_URL + APIS.todos);
      http.Response response = await http.get(url);
      debugPrint(response.body);
      return response;
    }catch(e){
      debugPrint(e.toString());
    }
  }

}