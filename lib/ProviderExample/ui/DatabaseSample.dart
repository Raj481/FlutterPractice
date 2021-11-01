import 'package:flutter/material.dart';
import 'package:flutter_practice/ProviderExample/database/DBHelper.dart';
import 'package:flutter_practice/ProviderExample/database/DataProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DatabaseSample extends StatefulWidget {
  const DatabaseSample({Key? key}) : super(key: key);

  @override
  _DatabaseSampleState createState() => _DatabaseSampleState();
}

class _DatabaseSampleState extends State<DatabaseSample> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DBHelper()),
        /*ChangeNotifierProxyProvider<DBHelper, DataProvider>(
          create: (context) => DataProvider([], dbHelper: null),
          update: (context, db, previous) => DataProvider(previous.items, dbHelper: db),
        ),*/
      ],
      child: DatabaseHome(),
    );
  }

}

class DatabaseHome extends StatefulWidget {
  const DatabaseHome({Key? key}) : super(key: key);

  @override
  _DatabaseHomeState createState() => _DatabaseHomeState();
}

class _DatabaseHomeState extends State<DatabaseHome> {

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

          ],
        ),
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

