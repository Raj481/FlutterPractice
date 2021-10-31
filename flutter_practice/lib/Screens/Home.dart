import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/BlockExample/BlockHomeScreen.dart';
import 'package:flutter_practice/CustomsWidgets/MyButton1.dart';
import 'package:flutter_practice/AudioRecordExample/RecordScreen.dart';
import 'package:flutter_practice/FlutterWidgetExample/FlutterWidgetExample.dart';
import 'package:flutter_practice/GetXExample/GetxHomeExample.dart';
import 'package:flutter_practice/NotificationExample/NotificationHomeExample.dart';
import 'package:flutter_practice/ProviderExample/ProviderExample.dart';
import 'package:flutter_practice/Screens/PaymentHomeScreen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldkey,
            drawerScrimColor: Colors.transparent,
            appBar: getAppbar(),
            //  drawer: getDrawer(),
            body: getBody()
        )
    );
  }


  AppBar getAppbar() => AppBar(
    backgroundColor: const Color(0XFFe5fbff),
    systemOverlayStyle:SystemUiOverlayStyle.light ,
    elevation: 0.5,
    centerTitle: true,
    title: const Text(
      "Testing Home",
      style: TextStyle(
          color: Color(0xff113a83),
          fontSize: 18
      ),
    ),
  );

  Drawer getDrawer(){
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            color: const Color(0XFFe5fbff)
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/sample_1.jpg",
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                    'Drawer Header',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    )
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () { },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () { },
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() => SingleChildScrollView(
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
                  name: "Block Pattern\nTest",
                  callback: (){
                    Get.to(const BlockHomeScreen());
                  }),

              MyButton1(
                  name: "GetX\nTest",
                  callback: (){
                    Get.to(GetxHomeExample());
                  }),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              MyButton1(
                  name: "Provider\nTest",
                  callback: (){
                    Get.to(ProviderTestHome());
                  }),

              MyButton1(
                  name: "Flutter\nWidget",
                  callback: (){
                    Get.to(FlutterWidgetExample());
                  }),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              MyButton1(
                  name: "Audio Play\nTest",
                  callback: (){ }),

              MyButton1(
                  name: "Record Audio\nTest",
                  callback: (){
                    Get.to(const RecordScreen());
                  }),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              MyButton1(
                  name: "Payment Gateway\nTest",
                  callback: (){
                    Get.to(PaymentHomeScreen());
                  }),

              MyButton1(
                  name: "Notification\nTest",
                  callback: (){
                    Get.to(NotificationHomeExample());
                  }),

            ],
          ),

        ],
      ),
    ),
  );

}