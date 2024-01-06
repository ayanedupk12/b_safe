import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  ///fontWeight: FontWeight.w500, // For Medium style
  ///fontWeight: FontWeight.w600, // For Semi-bold style
  /// fontWeight: FontWeight.normal, // For Regular style
  /// fontWeight: FontWeight.bold, // For Bold style

  ///ok///
  static  TextStyle logoStyle =
  GoogleFonts.montserrat(
    textStyle:
    const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
    )
  );


///ok///
  static TextStyle topicTextStyle =
  GoogleFonts.montserrat(
      textStyle:
    const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    )
  );

  static TextStyle descriptionTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      )
  );

  ///ok///
  static TextStyle descriptionTextStyleB =
  GoogleFonts.montserrat(
      textStyle:
      const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      )
  );

  ///ok///
  static TextStyle hintTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: Color(0xff707070),
      )
  );

  ///ok///
  static TextStyle dropDownTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      )
  );

  ///ok////
  static TextStyle appBarTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  );

  ///ok///
  static TextStyle buttonTextStyle =
  GoogleFonts.montserrat(
      textStyle:
      const TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      )
  );

  ///ok
  static TextStyle buttonTextStyleB =
  GoogleFonts.montserrat(
      textStyle:
      const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      )
  ) ;

}
