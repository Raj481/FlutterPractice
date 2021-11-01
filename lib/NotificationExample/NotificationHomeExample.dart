import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationHomeExample extends StatefulWidget {
  const NotificationHomeExample({Key? key}) : super(key: key);

  @override
  _NotificationHomeExampleState createState() => _NotificationHomeExampleState();
}

class _NotificationHomeExampleState extends State<NotificationHomeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: Container(),
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
        "Notification Test Home",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

}
