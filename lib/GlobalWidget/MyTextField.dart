
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double height;
  bool obSecure;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  MyTextField({
    super.key,
     this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
     this.hintText,
    this.controller,
    this.height=50,
    this.obSecure=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obSecure,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
