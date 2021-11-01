import 'package:equatable/equatable.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/book_state.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookSelected extends BookEvent {
  const BookSelected({required this.book});

  final Book book;

  @override
  List<Object> get props => [book];
}

class BookDeselected extends BookEvent {
  const BookDeselected();
}

class BookListClose extends BookEvent {
  const BookListClose();
}