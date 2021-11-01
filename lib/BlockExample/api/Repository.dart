import 'dart:async';

import 'package:flutter_practice/BlockExample/api/MovieApiProvider.dart';
import 'package:flutter_practice/BlockExample/models/ItemModel.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}