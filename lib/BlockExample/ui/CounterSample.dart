import 'package:flutter/material.dart';
import 'package:flutter_practice/BlockExample/bloc/blocs/CounterBloc.dart';
import 'package:flutter_practice/BlockExample/events/CounterAction.dart';
import 'package:get/get.dart';

class CounterSample extends StatefulWidget {
  const CounterSample({Key? key}) : super(key: key);

  @override
  _CounterSampleState createState() => _CounterSampleState();
}

class _CounterSampleState extends State<CounterSample> {

  var counterbloc = CounterBloc();

  @override
  void dispose() {
    counterbloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: (){
          counterbloc.eventSink.add(CounterAction.Increment);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


  AppBar getAppbar(){
    return AppBar(
      backgroundColor: const Color(0XFFe5fbff),
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xff113a83),
        ),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Counter Block Sample",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

  Widget getBody(){

    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter Bloc Testing'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                      stream: counterbloc.counterStream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        return Text("${snapshot.data}");
                      })
                ],
              )

            ],
          ),
        ),
      ],
    );

  }

}
