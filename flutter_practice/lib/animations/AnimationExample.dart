import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
       Navigator.pop(context);
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
