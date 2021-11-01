import 'package:flutter/material.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/direct_navigation.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/navigation_2_0/ui.dart';
import 'package:flutter_practice/BlockExample/ui/NavigationBlocSample/route_navigation.dart';
import 'package:flutter_practice/CustomsWidgets/MyButton1.dart';

class NavigationSample extends StatelessWidget {
  NavigationSample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NavigationHome();
  }
}

class NavigationHome extends StatefulWidget {
  NavigationHome({Key? key}) : super(key: key);
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {

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
        "Navigation Home",
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
                    name: "Direct Navigation",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DirectNavigationHome() ) );
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Route Navigation",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RouteNavigationHome() ) );
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton1(
                    name: "Navigation 2.0",
                    callback: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Navigation20NavigationHome() ) );
                    }),
              ],
            ),

          ],
        ),
      ),
    );

  }

}

