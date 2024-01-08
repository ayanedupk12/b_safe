
import 'package:b_safe/Utils/TextStyles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  String? errorText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double height;
  bool obSecure;
  TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  MyTextField({
    super.key,
    this.keyboardType,
     this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
     this.hintText,
     this.errorText,
    this.controller,
    this.height=50,
    this.obSecure=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: controller,
        obscureText: obSecure,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: const TextStyle(fontSize: 10,color: Colors.red),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: CustomTextStyles.hintTextStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
