import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppColors{
  static const mainColor = Color(0xff6281A5);
  static const main2Coclor = Color(0xff1158AA);
  static const backGroundColor = Color(0xffF4F7FA);
  static const iconColor = Color(0xff0000003D);
}


void showMessage(messege) {
  Fluttertoast.showToast(
    msg: messege,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
