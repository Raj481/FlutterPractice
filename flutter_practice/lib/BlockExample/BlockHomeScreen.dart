import 'package:flutter/material.dart';
import 'package:flutter_practice/BlockExample/ui/CounterSample.dart';
import 'package:flutter_practice/BlockExample/ui/DatabaseSample.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationSample.dart';
import 'package:flutter_practice/BlockExample/ui/UserApiSample.dart';
import 'package:flutter_practice/CustomsWidgets/MyButton1.dart';
import 'package:flutter_practice/LoginBlocSample/login.dart';


class BlockHomeScreen extends StatefulWidget {
  const BlockHomeScreen({Key? key}) : super(key: key);
  @override
  _BlockHomeScreenState createState() => _BlockHomeScreenState();
}

class _BlockHomeScreenState extends State<BlockHomeScreen> {

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
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Block Test Home",
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
                    name: "Counter\nSample",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CounterSample() ) );
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "User Api\nSample",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UserApiSample() ) );
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Database\nSample",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DatabaseSample() ) );
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Login\nSample",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login() ) );
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Navigation\nSample",
                    callback: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NavigationSample() ) );
                    }),
              ],
            ),

          ],
        ),
      ),
    );

  }

}
