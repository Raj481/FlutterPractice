import 'package:flutter/material.dart';
import 'package:flutter_practice/ProviderExample/database/DatabaseHelper.dart';
import 'package:flutter_practice/ProviderExample/models/Note.dart';


class NoteProvider with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }

  Future getNotes() async {
    final notesList = await DatabaseHelper.getNotesFromDB();
    _items = notesList.map((item) => Note(item['id'], item['title'], item['content'], item['imagePath'])).toList();

    notifyListeners();
  }
}