
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyButton extends StatelessWidget {
  final VoidCallback onPress;
  final double width;
  final double height;
  final double borderRadios;
  final String title;
  final bool loading;
  final Color? color;

  const MyButton({Key? key,
    this.loading = false,
    required this.onPress,
    this.title='Login',
    this.height = 50,
    this.width = double.infinity,
    this.borderRadios =10.0,
    this.color = AppColors.main2Coclor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadios),
          color: color,
        ),
        child: Center(child: loading
            ? const SizedBox(
          height: 18,
              width: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                        color: Colors.white,
                      ),
            )
            : Text(title,style:  CustomTextStyles.buttonTextStyle,),
        ),
      ),
    );
  }
}



sWdth(){
  return  SizedBox(width: Get.width * .05,);
}
sHeight(){
  return  SizedBox(height: Get.height * .05,);
}
