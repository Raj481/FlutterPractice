import 'package:flutter/material.dart';
import 'package:flutter_practice/ProviderExample/logic/Counter.dart';
import 'package:flutter_practice/ProviderExample/widgets/Count.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class CounterSample extends StatefulWidget {
  const CounterSample({Key? key}) : super(key: key);
  @override
  _CounterSampleState createState() => _CounterSampleState();
}

class _CounterSampleState extends State<CounterSample> {

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
          lazy: false,
        ),
      ],
      child: CounterHome(),
    );
  }

}

class CounterHome extends StatefulWidget {
  const CounterHome({Key? key}) : super(key: key);
  @override
  _CounterHomeState createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('You have pushed the button this many times:'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            Count(),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),

        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: (){

          setState(() {
            context.read<Counter>().increment();
          });
          // context.read<Counter>().increment()
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
          Get.back();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Provider Test Home",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

}

