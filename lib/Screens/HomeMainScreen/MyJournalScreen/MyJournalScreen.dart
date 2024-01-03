import 'package:b_safe/GlobalWidget/MyButton.dart';
import 'package:b_safe/Utils/AppConstants/English/MyJournalConstantsE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Utils/Textstyles.dart';
import 'JournalWidget.dart';

class MyJournalScreen extends StatelessWidget {
  const MyJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .05,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height2(),
            Text(
              MyJournalConstantsE.title.tr,
              style: CustomTextStyles.descriptionTextStyle
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            height2(),
            Text(
              MyJournalConstantsE.title1.tr,
              style: CustomTextStyles.descriptionTextStyleB,
            ),
            height2(),
            JournalFormField(
              hintText: MyJournalConstantsE.hintText.tr,
            ),
            height2(),
            Text(
              MyJournalConstantsE.title2.tr,
              style: CustomTextStyles.descriptionTextStyleB,
            ),
            height2(),
            JournalFormField(
              hintText: MyJournalConstantsE.hintText.tr,
            ),
            height2(),
            Text(
              MyJournalConstantsE.title3.tr,
              style: CustomTextStyles.descriptionTextStyleB,
            ),
            height2(),
            JournalFormField(
              hintText: MyJournalConstantsE.hintText.tr,
            ),
            height2(),
            Text(
              MyJournalConstantsE.title4.tr,
              style: CustomTextStyles.descriptionTextStyleB,
            ),
            height2(),
            Container(
              height: Get.height * .2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * .25),
                  child: MyButton(
                      borderRadios: 10,
                      height: Get.height * .05,
                      title: MyJournalConstantsE.button1.tr,
                      onPress: () {}),
                ),
              ),
            ),
            height2(),
            Text(
              MyJournalConstantsE.title5.tr,
              style: CustomTextStyles.descriptionTextStyleB,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .25),
                child: MyButton(
                    borderRadios: 10,
                    height: Get.height * .05,
                    title: MyJournalConstantsE.button2.tr,
                    onPress: () {}),
              ),
            ),
            height2(),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(''),
            ),
            height2(),
            MyButton(
              title: "Submit",
              height: Get.height * .05,
              onPress: () {
                Get.defaultDialog(
                    title: "Safety Email",
                    titleStyle: CustomTextStyles.logoStyle,
                    contentPadding: const EdgeInsets.all(20),
                    content: Column(
                      children: [
                        MyTextField(),
                        MyButton(
                            title: 'Send',
                            height: Get.height *.05,
                            onPress: () {
                              Get.back();
                            }),
                        MyButton(
                            title: 'Cancel',
                            height: Get.height *.05,
                            color: Colors.grey,
                            onPress: () {
                              Get.back();
                            }),
                      ],
                    ));
              },
            ),
            height2(),
            height5(),
            height5(),
            height5(),
          ],
        ),
      ),
    );
  }
}

height2() {
  return SizedBox(
    height: Get.height * .02,
  );
}

height5() {
  return SizedBox(
    height: Get.height * .05,
  );
}
