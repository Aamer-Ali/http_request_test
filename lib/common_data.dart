import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class CommonData{
  static createToast({String message,BuildContext context}){
    Toast.show(message, context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
  }
}