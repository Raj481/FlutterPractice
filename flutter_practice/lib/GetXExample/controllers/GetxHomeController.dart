import 'dart:convert';

import 'package:flutter_practice/Apis/HttpServices.dart';
import 'package:flutter_practice/GetXExample/Models/PostModel.dart';
import 'package:get/get.dart';

class GetxHomeController extends GetxController {

  var posts = <Posts>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async{
    var response = await HttpServices.getPosts();
    if(response!.statusCode == 200){
      List<Posts> results = <Posts>[];
      var jsonData = await json.decode(response.body);
      for(var i in jsonData){
        Posts post = Posts.fromJson(i);
        results.add(post);
      }
      posts.value = results;
    }
  }

}