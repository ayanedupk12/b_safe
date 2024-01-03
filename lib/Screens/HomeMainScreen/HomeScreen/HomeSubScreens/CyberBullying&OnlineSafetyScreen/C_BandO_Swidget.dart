


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../Utils/Textstyles.dart';

class C_BandO_Swidget extends StatelessWidget {
  final String text;
  final String image;
  final GestureTapCallback? onTap;
  const C_BandO_Swidget(
      {super.key, required this.text, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * .25,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: .5,
              blurRadius: 3,
              offset: Offset(0, 1)
            )
          ],
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                height: Get.height * .15,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * .2,
                  vertical: Get.height * .02),
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: CustomTextStyles.descriptionTextStyleB,
              ),
            )
          ],
        ),
      ),
    );
  }
}