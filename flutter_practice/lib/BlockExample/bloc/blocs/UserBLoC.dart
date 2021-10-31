import 'dart:async';

import 'package:flutter_practice/BlockExample/api/UserService.dart';
import 'package:flutter_practice/BlockExample/models/User.dart';

class UserBLoC {
  Stream<List<User>?> get usersList async* {
    yield await UserService.browse();
  }

  final StreamController<int> _userCounter = StreamController<int>();

  Stream<int> get userCounter => _userCounter.stream;

  UserBLoC() {
    usersList.listen((list) => _userCounter.add(list!.length));
  }
}