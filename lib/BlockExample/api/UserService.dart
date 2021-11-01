import 'package:flutter_practice/BlockExample/models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserService {
  static String _url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>>? browse() async {
    List? collection;
    List<User>? _contacts;
    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _contacts = collection!.map((json) => User.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return _contacts!;
  }
}