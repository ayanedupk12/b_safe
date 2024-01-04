import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  ///fontWeight: FontWeight.w500, // For Medium style
  ///fontWeight: FontWeight.w600, // For Semi-bold style
  /// fontWeight: FontWeight.normal, // For Regular style
  /// fontWeight: FontWeight.bold, // For Bold style

  static  TextStyle logoStyle =
  GoogleFonts.montserrat(
    textStyle:
    TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
    )
  );

  static TextStyle topicTextStyle =
  GoogleFonts.montserrat(
      textStyle:
    TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )
  );

  static TextStyle descriptionTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      )
  );

  static TextStyle descriptionTextStyleB =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  );

  static TextStyle hintTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: Color(0xff707070),
      )
  );

  static TextStyle dropDownTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      )
  );

  static TextStyle appBarTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  );

  static TextStyle buttonTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      )
  );

  static TextStyle buttonTextStyleB =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 13,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      )
  ) ;

}
