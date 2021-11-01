import 'package:flutter/cupertino.dart';

double setWidth(BuildContext context, double ratio){
  return MediaQuery.of(context).size.width * ratio;
}

double setHeight(BuildContext context, double ratio){
  return MediaQuery.of(context).size.height * ratio;
}

double setPixel(BuildContext context, double ratio){
  return MediaQuery.of(context).devicePixelRatio * ratio;
}

double setTextScaleFactor(BuildContext context, double ratio){
  return MediaQuery.of(context).textScaleFactor * ratio;
}