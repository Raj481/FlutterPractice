import 'package:flutter/material.dart';
import 'package:flutter_practice/CustomsWidgets/MyButton1.dart';
import 'package:flutter_practice/GetXExample/ui/ApiGetXSample.dart';
import 'package:flutter_practice/GetXExample/ui/DatabaseExample.dart';
import 'package:get/get.dart';

class GetxHomeExample extends StatefulWidget {
  const GetxHomeExample({Key? key}) : super(key: key);

  @override
  _GetxHomeExampleState createState() => _GetxHomeExampleState();
}

class _GetxHomeExampleState extends State<GetxHomeExample> {

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
        "GetX Test Home",
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Api\nSample",
                    callback: (){
                      Get.to(ApiGetXSample());
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Database\nSample",
                    callback: (){
                      Get.to(DatabaseExample());
                    }),
              ],
            ),

          ],
        ),
      ),
    );

  }

}
