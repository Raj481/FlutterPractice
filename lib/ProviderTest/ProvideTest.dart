
import 'package:flutter/material.dart';
import 'package:flutter_practice/ProviderTest/Styles/FontStyles.dart';
import 'package:flutter_practice/Utils/ColorConstant.dart';

import 'Ui/TodoScreen.dart';


void main() {
  runApp(ProviderMain());
}

class ProviderMain extends StatefulWidget {
  const ProviderMain() : super();

  @override
  _ProviderMainState createState() => _ProviderMainState();
}

class _ProviderMainState extends State<ProviderMain> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/todo': (BuildContext context) => new TodoScreen(),
      },
      home: Builder(
        builder: (context){

          return SafeArea(
            top: true,
            child: Scaffold(
              backgroundColor: ColorsConstant.turquoise,
              body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            // Post button layout
                            Expanded(
                              child: InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 60,

                                      child: Center(
                                        child: Text(
                                          "Posts",
                                          style: FontStyles.font1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Todos button layout
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, "/todo");
                                },
                                child: Container(
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 60,

                                      child: Center(
                                        child: Text(
                                          "Todos",
                                          style: FontStyles.font1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            // Comments button layout
                            Expanded(
                              child: Container(
                                child: Card(
                                  //semanticContainer: false,
                                  elevation: 5,
                                  child: Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        "Comments",
                                        style: FontStyles.font1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Todos button layout
                            Expanded(
                              child: Container(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        "Albums",
                                        style: FontStyles.font1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            // Photos button layout
                            Expanded(
                              child: Container(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        "Photos",
                                        style: FontStyles.font1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Users button layout
                            Expanded(
                              child: Container(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        "Users",
                                        style: FontStyles.font1,
                                      ),
                                    ),
                                  ),

                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),

    );
  }


}
