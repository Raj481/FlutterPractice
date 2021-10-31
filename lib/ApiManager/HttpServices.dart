import 'dart:developer';

import 'package:flutter_practice/ApiManager/Apis.dart';
import 'package:http/http.dart';

class HttpServices{

  String TAG = "HttpServicesTAG";

  Uri UrlParse(String url){
    return Uri.parse(url);
  }

  Future<Response> getTodos() async{
    Response response = await get(UrlParse(Apis.TodoApi));
    return response;
  }

  Future<Response> getPosts() async{
    Response response = await get(UrlParse(Apis.PostApi));
    return response;
  }

  Future<Response> getComments() async{
    Response response = await get(UrlParse(Apis.CommentsApi));
    return response;
  }

  Future<Response> getAlbums() async{
    Response response = await get(UrlParse(Apis.AlbumApi));
    return response;
  }

  Future<Response> getPhotos() async{
    Response response = await get(UrlParse(Apis.PhotosApi));
    return response;
  }

  Future<Response> getUsers() async{
    Response response = await get(UrlParse(Apis.UserApi));
    return response;
  }
}