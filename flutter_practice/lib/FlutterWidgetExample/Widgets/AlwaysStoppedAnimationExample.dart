

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlwaysStoppedAnimationExample extends StatefulWidget {
  const AlwaysStoppedAnimationExample({Key? key}) : super(key: key);

  @override
  _AlwaysStoppedAnimationExampleState createState() => _AlwaysStoppedAnimationExampleState();
}

class _AlwaysStoppedAnimationExampleState extends State<AlwaysStoppedAnimationExample> {

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
        "AlwaysStoppedAnimation",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

  Widget getBody(){

    return Container(
      decoration: BoxDecoration(
          color: const Color(0XFFe5fbff).withOpacity(0.1)
      ),
    );

  }

}
