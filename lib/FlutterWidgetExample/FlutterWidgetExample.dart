import 'package:flutter/material.dart';
import 'package:flutter_practice/CustomsWidgets/MyButton1.dart';
import 'package:flutter_practice/FlutterWidgetExample/Widgets/AlwaysStoppedAnimationExample.dart';
import 'package:get/get.dart';

class FlutterWidgetExample extends StatefulWidget {
  const FlutterWidgetExample({Key? key}) : super(key: key);

  @override
  _FlutterWidgetExampleState createState() => _FlutterWidgetExampleState();
}

class _FlutterWidgetExampleState extends State<FlutterWidgetExample> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
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
        "Flutter Widgets",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

  Widget getBody(){

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0XFFe5fbff).withOpacity(0.1)
        ),

        child: Column(
          children: [
            // AlwaysStoppedAnimation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "AlwaysStoppedAnimation",
                    callback: (){
                      Get.to( AlwaysStoppedAnimationExample());
                    }),
              ],
            ),
          ],
        ),
      ),
    );

  }

}
