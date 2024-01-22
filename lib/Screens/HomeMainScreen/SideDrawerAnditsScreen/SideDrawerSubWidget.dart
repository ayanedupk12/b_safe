import 'package:flutter/material.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/TextStyles.dart';

class DrawerSubWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  const DrawerSubWidget(
      {super.key,
        this.trailing,
        required this.iconPath,
        required this.title,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            iconPath,
            color: AppColors.main2Coclor,
            height: 25,
          ),
          title: Text(
            title,
            style: CustomTextStyles.buttonTextStyleB,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}