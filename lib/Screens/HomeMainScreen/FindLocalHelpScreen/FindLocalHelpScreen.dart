import 'package:b_safe/GlobalWidget/MyTextField.dart';
import 'package:b_safe/Utils/AppConstants/English/FindLocalScreenConstantsE.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'FLHSwidget.dart';

class FindLocalHelpScreen extends StatelessWidget {
  const FindLocalHelpScreen({super.key});

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
            size2(),
            MyTextField(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: FLscreenConstantsE.hintText.tr,
              suffixIcon: const Icon(Icons.menu),
            ),
            size2(),
            Text(
              FLscreenConstantsE.title.tr,
              style: CustomTextStyles.topicTextStyle,
            ),
            size2(),
            FLHSwidget(
              text: FLscreenConstantsE.text1.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text2.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text3.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text4.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text5.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text5.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text5.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text5.tr,
              number: FLscreenConstantsE.number,
            ),
            FLHSwidget(
              text: FLscreenConstantsE.text5.tr,
              number: FLscreenConstantsE.number,
            ),
            size2(),
            size2(),
            size2(),
            size2(),
            size2(),
            size2(),
            size2(),
          ],
        ),
      ),
    );
  }
}

size1() {
  return const SizedBox(
    height: 10,
  );
}
size2() {
  return const SizedBox(
    height: 15,
  );
}
