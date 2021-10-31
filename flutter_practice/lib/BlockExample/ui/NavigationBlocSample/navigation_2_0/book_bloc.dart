import 'package:bloc/bloc.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/book_event.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/book_state.dart';

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