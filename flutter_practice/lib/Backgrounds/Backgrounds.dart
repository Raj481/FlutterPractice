
import 'package:flutter/cupertino.dart';

class Backgrounds {
  
  static const bgItem1 = BoxDecoration(
      color: Color(0XFFe5fbff),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    boxShadow: [
      BoxShadow(
        color: Color(0XFF10000000),
        offset: Offset(0.0,1.5)
      )
    ]
  );
  
}