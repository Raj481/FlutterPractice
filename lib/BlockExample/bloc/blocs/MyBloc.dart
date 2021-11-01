import 'package:bloc/bloc.dart';
import 'package:flutter_practice/BlockExample/bloc/events/MapEvents.dart';
import 'package:flutter_practice/BlockExample/bloc/states/MyState.dart';

class MyBloc extends Bloc<MyEvent, MyState> {

  MyBloc() : super(StateA()) {

    on<EventA>((event, emit) => emit(StateA()));

    on<EventB>((event, emit) => emit(StateB()));

  }

}