
import 'package:bloc/bloc.dart';
import 'package:flutter_practice/BlockExample/bloc/events/BookEvent.dart';
import 'package:flutter_practice/BlockExample/bloc/states/BookState.dart';

class BookBloc extends Bloc<BookEvent, BookState> {

  BookBloc() : super(BookState()) {

    on<BookSelected>((event, emit) {
      emit(state.copyWith(selectedBook: () => event.book));
    });

    on<BookDeselected>((event, emit) {
      emit(state.copyWith(selectedBook: () => null));
    });

  }

}
