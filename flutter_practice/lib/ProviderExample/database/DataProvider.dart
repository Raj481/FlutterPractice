import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_practice/ProviderExample/database/DBHelper.dart';
import 'package:flutter_practice/ProviderExample/models/Data.dart';


class DataProvider with ChangeNotifier {

  DBHelper? dbHelper;
  List<Data> _items = [];
  final tableName = 'my_table';

  DataProvider(this._items, this.dbHelper) {
    if (dbHelper != null)
      fetchAndSetData();
  }

  List<Data> get items => [..._items];

  void addPlace(String title, File selectedImage) {
    if (dbHelper!.db != null) { // do not execute if db is not instantiate
      final newPlace = Data(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          image: ""
      );
      _items.add(newPlace);
      notifyListeners();
      dbHelper!.insert(tableName, {'id': newPlace.id!, 'title': newPlace.title!, 'image': newPlace.image!});
    }
  }

  Future<void> fetchAndSetData() async {
    if (dbHelper!.db != null) {

      // do not execute if db is not instantiate
      final dataList = await dbHelper!.getData(tableName);

      _items = dataList.map((item) => Data(
          id: item['id'],
          title: item['title'],
          image: item['image']
        //File(item['image'])
      )).toList();

      notifyListeners();
    }
  }

}