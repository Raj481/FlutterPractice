import 'package:flutter/material.dart';
import 'package:flutter_practice/CustomsWidgets/MyButton1.dart';
import 'package:flutter_practice/ProviderExample/ui/CounterSample.dart';
import 'package:flutter_practice/ProviderExample/ui/DatabaseSample.dart';
import 'package:flutter_practice/ProviderExample/navigation_sample/NavigationSample.dart';
import 'package:flutter_practice/ProviderExample/widgets/Count.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'logic/Counter.dart';


class ProviderTestHome extends StatefulWidget {
  const ProviderTestHome({Key? key}) : super(key: key);
  @override
  _ProviderTestHomeState createState() => _ProviderTestHomeState();
}

class _ProviderTestHomeState extends State<ProviderTestHome> {

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Counter(),
            lazy: false,
        ),
      ],
      child: ProviderHome(),
    );
  }

}

class ProviderHome extends StatefulWidget {
  const ProviderHome({Key? key}) : super(key: key);

  @override
  _ProviderHomeState createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  AppBar getAppbar() => AppBar(
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

  Widget getBody(){

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0XFFe5fbff).withOpacity(0.1)
        ),

        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Counter\nSample",
                    callback: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CounterSample()));
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Database\nSample",
                    callback: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> DatabaseSample()));
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Navigation\nSample",
                    callback: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context)=> NavigationSample()));
                    }),
              ],
            ),

          ],
        ),
      ),
    );

  }

}

