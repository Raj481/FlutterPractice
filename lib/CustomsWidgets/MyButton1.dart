
import 'package:flutter/material.dart';
import 'package:flutter_practice/Utils/Utils.dart';

class MyButton1 extends StatelessWidget {
  
  String name = "";
  Function() callback;
  
   MyButton1({
     required this.name,
     required this.callback});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          shadowColor: Color(0xff50113a83),
          elevation: 8.0,
          margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
            disabledColor: Colors.grey,
            padding: EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.zero,
              height: setHeight(context,0.07),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    stops: [0.1, 0.9],
                    colors: [Colors.cyan.withOpacity(.2), Colors.cyan.withOpacity(.5)]
                )
              ),
              child: Center(
                heightFactor: 0,
                child: Text(
                    name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff113a83),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            onPressed: () => callback(),
          ),
        )
    );
  }
}
