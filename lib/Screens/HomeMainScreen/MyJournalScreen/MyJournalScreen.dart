import 'dart:io';
import 'package:b_safe/GlobalWidget/MyButton.dart';
import 'package:b_safe/Screens/HomeMainScreen/MyJournalScreen/MyJournalController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import '../../../GlobalWidget/MyTextField.dart';
import '../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../Utils/Textstyles.dart';
import '../../../validatorS.dart';
import 'JournalWidget.dart';

class MyJournalScreen extends StatelessWidget {
  MyJournalScreen({super.key});
  MyJournalController controller = Get.put(MyJournalController());
  final validator=Get.put(ValidatorController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyJournalController>(
      builder: (__) {
        return controller.uploading?SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(child: CircularProgressIndicator()),
                SizedBox(height: 20,),
                Center(child: Text('Please Wait...')),
              ],
            )):Padding(
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
                  style: CustomTextStyles.descriptionTextStyle,
                  textAlign: TextAlign.justify,
                ),
                height2(),
                Text(
                  MyJournalConstantsE.title1.tr,
                  style: CustomTextStyles.topicTextStyle,
                ),
                height2(),
                JournalFormField(
                  hintText: MyJournalConstantsE.hintText.tr,
                  controller: controller.whenDidItHappen,
                ),
                height2(),
                Text(
                  MyJournalConstantsE.title2.tr,
                  style: CustomTextStyles.topicTextStyle,
                ),
                height2(),
                JournalFormField(
                  hintText: MyJournalConstantsE.hintText.tr,
                  controller: controller.whatHappened,

                ),
                height2(),
                Text(
                  MyJournalConstantsE.title3.tr,
                  style: CustomTextStyles.topicTextStyle,
                ),
                height2(),
                JournalFormField(
                  hintText: MyJournalConstantsE.hintText.tr,
                  controller: controller.howDidItHappened,

                ),
                height2(),
                Text(
                  MyJournalConstantsE.title4.tr,
                  style: CustomTextStyles.topicTextStyle,
                ),
                height2(),
                Container(
                  height: Get.height * .2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: controller.attachedFile!=null?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Card(child: Image.file(controller.attachedFile!,fit: BoxFit.cover,)),
                        // ),
                        Text(controller.attachedFile!.path.split('/').last.substring(0,5)),
                        InkWell(
                            onTap: (){
                              controller.attachedFile=null;
                              controller.update();
                            },
                            child: const Icon(Icons.close)),
                      ],
                    ),
                  ):Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * .25),
                      child: MyButton(
                          borderRadios: 10,
                          height: Get.height * .05,
                          title: MyJournalConstantsE.button1.tr,
                          onPress: ()async {
                            await controller.pickFile();
                          }),
                    ),
                  ),
                ),
                height2(),
                Text(
                  MyJournalConstantsE.title5.tr,
                  style: CustomTextStyles.topicTextStyle,
                ),
                height2(),
                Align(
                  alignment: Alignment.centerRight,
                  child: controller.soundFile!=null
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(controller.soundFile!.path.split('/').last),
                       InkWell(
                           onTap: (){
                             controller.soundFile=null;
                             controller.update();
                           },
                           child: Icon(Icons.close)),
                    ],
                  )
                      :SizedBox(
                    // width: Get.width * 0.8,
                    child: SocialMediaRecorder(
                      sendButtonIcon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      encode: AudioEncoderType.AAC,
                      sendRequestFunction: (File soundFile, String time) {
                        controller.soundFile=soundFile;
                        controller.update();
                        // __.uploadAudioToFirebase(soundFile);
                      },
                    ),
                  ),
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
                            Form(
                              key: controller.globalKey,
                              child: MyTextField(
                                validator: validator.emailValidator,
                                controller: controller.emailController,
                                hintText: 'Email',
                              ),
                            ),
                            height2(),
                            MyButton(
                                title: 'Send',
                                height: Get.height * .05,
                                onPress: () async{
                                  await controller.uploadMedia();
                                  // await controller.sendEmail();
                                  // Get.back();
                                }),
                            height2(),
                            MyButton(
                                title: 'Cancel',
                                height: Get.height * .05,
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
