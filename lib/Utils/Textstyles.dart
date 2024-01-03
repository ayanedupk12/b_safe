import 'package:flutter/material.dart';

class CustomTextStyles {
  ///fontWeight: FontWeight.w500, // For Medium style
  ///fontWeight: FontWeight.w600, // For Semi-bold style
  /// fontWeight: FontWeight.normal, // For Regular style
  /// fontWeight: FontWeight.bold, // For Bold style

  static const TextStyle logoStyle =  TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static TextStyle topicTextStyle =const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle descriptionTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle descriptionTextStyleB = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle hintTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Color(0xff707070),
  );

  static TextStyle dropDownTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle appBarTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle buttonTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonTextStyleB = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

}
