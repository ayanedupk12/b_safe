import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessage(message){
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.2),
      textColor: Colors.white,
      fontSize: 12.0
  );
}