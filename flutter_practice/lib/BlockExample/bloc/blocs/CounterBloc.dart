import 'dart:async';
import 'package:flutter_practice/BlockExample/events/CounterAction.dart';

class CounterBloc {

  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;


  CounterBloc(){

    int counter = 0;

    eventStream.listen((event) {

      if(event == CounterAction.Increment){
        counter++;
      }

      if(event == CounterAction.Decrement){
        counter--;
      }

      if(event == CounterAction.Reset){
        counter = 0;
      }

      counterSink.add(counter);

    });

  }


  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }

}