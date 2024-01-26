import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Utils/Colors.dart';
import '../../../../../Utils/IconsPaths.dart';
import '../../../../../Utils/Textstyles.dart';

class MTCscreenWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback? onTap;
  final GestureTapCallback? tapForCall;
  final GestureLongPressStartCallback? onLongPressStart;

  MTCscreenWidget({
    super.key,
    this.onTap,
    this.tapForCall,
    required this.title,
    required this.subtitle,
    this.onLongPressStart,
  });

  @override
  Widget build(BuildContext context) {
    bool _isPressed = false;
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onLongPressStart: onLongPressStart,
          onLongPressEnd: (details) {
            _isPressed = false;
          },
          child: Card(
            elevation: 2,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey,
            child: Center(
              child: ListTile(
                onTap: tapForCall,
                leading: CircleAvatar(
                  backgroundColor: AppColors.backGroundColor,
                  radius: 30,
                  child: Image.asset(
                    AppIcons.contactsicon,
                    color: AppColors.main2Coclor,
                    height: 35,
                  ),
                ),
                title: Text(
                  title,
                  style: CustomTextStyles.phoneNumbr,
                ),
                subtitle: Text(
                  subtitle,
                  style: CustomTextStyles.hintTextStyle,
                ),
                trailing: InkWell(
                    onTap: onTap,
                    child: Image.asset(AppIcons.editicon,height: 25,)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
