

import 'package:flutter/material.dart';
import '../../../../../Utils/Colors.dart';
import '../../../../../Utils/IconsPaths.dart';
import '../../../../../Utils/Textstyles.dart';

class MTCscreenWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback? onTap;
  MTCscreenWidget(
      {super.key,
        this.onTap,
        required this.title,
        required this.subtitle,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          elevation: 2,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.grey,
          child: Center(
            child: ListTile(
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
                style: CustomTextStyles.dropDownTextStyle,
              ),
              subtitle: Text(
                subtitle,
                style: CustomTextStyles.hintTextStyle,
              ),
              trailing: IconButton(onPressed: onTap, icon: Icon(Icons.edit_note)),
            ),
          ),
        ),
      ),
    );
  }
}