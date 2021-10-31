import 'package:flutter/material.dart';
import 'package:flutter_practice/Backgrounds/Backgrounds.dart';
import 'package:flutter_practice/BlockExample/models/User.dart';
import 'package:flutter_practice/Utils/Utils.dart';
import 'package:get/get.dart';

class UserDetailScreen extends StatefulWidget {

  UserDetailScreen({
    Key? key,
    required this.user
  }) : super(key: key);

  late User user;

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [

              Container(
                margin: EdgeInsets.only(top: setHeight(context, 0.2)),
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                            "Address".toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff113a83)
                            ),
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                              "${widget.user.address!.street},${widget.user.address!.suite}"
                                  "\n${widget.user.address!.city} - ${widget.user.address!.zipcode}"
                                  "\nContact : ${widget.user.phone}".toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: Backgrounds.bgItem1,
                  height: setHeight(context, 0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Text(
                              widget.user.name.toString(),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff113a83)
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Text(
                              widget.user.email.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff000000)
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Text(
                              widget.user.phone.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff113a83)
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

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
        "Users Detail",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
      /* actions: [
        IconButton(
          icon: const Icon(
            Icons.file_copy_sharp,
            color: Color(0xff113a83),
          ),
          onPressed: (){

          },
        )
      ],*/
    );
  }

}
