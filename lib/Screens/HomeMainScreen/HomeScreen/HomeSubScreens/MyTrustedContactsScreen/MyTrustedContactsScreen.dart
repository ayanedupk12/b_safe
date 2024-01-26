import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/GlobalWidget/MyButton.dart';
import 'package:b_safe/GlobalWidget/MyTextField.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/MyTrustedContactsScreen/MTCscreenWidget.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Routs/RoutsNames.dart';
import '../../../../../Utils/AppConstants/EnglishConstants.dart';
import 'MTCcontroller.dart';

class MyTrustedContactsScreen extends StatelessWidget {
  MyTrustedContactsScreen({super.key});
  final MTCcontroller mtCcontroller = Get.put(MTCcontroller());
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MTCcontroller>(builder: (__) {
      return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            HomeScreenConstantsE.myTrustedContacts.tr,
            style: CustomTextStyles.appBarTextStyle,
          ),
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(RouteNames.homeMainScreen);
              },
              icon: const Center(child: Icon(Icons.arrow_back_ios))),
        ),
        body: __.loading == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
                child: __.contactModelList.isEmpty
                    ? Center(
                        child: Text(
                        'No Contact Added Yet !',
                        style: CustomTextStyles.topicTextStyle,
                      ))
                    : ListView.builder(
                        itemCount: __.contactModelList.length,
                        itemBuilder: (context, index) {
                          return MTCscreenWidget(
                            title: __.contactModelList[index].name,
                            subtitle: __.contactModelList[index].phoneNumber,
                            tapForCall: () {
                              globalController.makeACall(
                                  __.contactModelList[index].phoneNumber);
                            },
                            // onLongPressStart: (ok) {
                            //   __.pressStartTime = DateTime.now();
                            //   __.isPressed = true;
                            //   Get.defaultDialog(
                            //       title: 'Hey ok',
                            //       content: Column(
                            //         children: [
                            //           MyButton(
                            //             title: 'Make a call',
                            //             onPress: () {},
                            //           ),
                            //           height2(),
                            //           MyButton(title: 'Delete', onPress: () {}),
                            //         ],
                            //       ));
                            // },
                            onTap: () {
                              String contactId = __.contactModelList[index]
                                  .id; // Assuming ContactModel has an 'id' field
                              __.newName.text = __.contactModelList[index].name;
                              __.newPhone.text =
                                  __.contactModelList[index].phoneNumber;
                              Get.defaultDialog(
                                title: "Edit my trusted contact?",
                                titleStyle: CustomTextStyles.logoStyle,
                                titlePadding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 20),
                                contentPadding: const EdgeInsets.all(20),
                                content: Column(
                                  children: [
                                    MyTextField(
                                      height: 60,
                                      controller: __.newName,
                                      hintText: "Enter Name",
                                      maxLength: 20,
                                    ),
                                    height2(),
                                    MyTextField(
                                      maxLength: 11,
                                      hintText: "+92XXXXXXXX",
                                      height: 60,
                                      controller: __.newPhone,
                                    ),
                                    height5(),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: MyButton(
                                            loading: __.loading,
                                            title: 'Edit',
                                            onPress: () {
                                              /// Check if changes have been made
                                              if (__.newName.text !=
                                                      __.contactModelList[index]
                                                          .name ||
                                                  __.newPhone.text !=
                                                      __.contactModelList[index]
                                                          .phoneNumber) {
                                                __.editContact(
                                                    contactId); // Edit the contact using contactId
                                              }
                                              Get.back(); // Close the dialog after editing or no changes
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: MyButton(
                                            loading: __.loading,
                                            title: 'Delete',
                                            onPress: () {
                                              __.deleteContact(contactId);
                                              Get.back(); // Close the dialog after editing or no changes
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                title: HomeScreenConstantsE.myTrustedContacts.tr,
                titleStyle: CustomTextStyles.logoStyle,
                titlePadding:
                const EdgeInsets.only(left: 25, right: 25, top: 20),
                contentPadding: const EdgeInsets.all(20),
                content: Column(
                  children: [
                    MyTextField(
                      controller: __.name,
                      height: 60,
                      maxLength: 20,
                      hintText: 'Name i.e Alex...',
                    ),
                    height2(),
                    MyTextField(
                      keyboardType: TextInputType.phone,
                      controller: __.phone,
                      height: 60,
                      hintText: "+92XXXXXXXX",
                      maxLength: 11,
                    ),
                    height2(),
                    MyButton(
                      height: 40,
                        width: Get.width * .35,
                        title: MyTrustedContactsConstantsE.saveText.tr,
                        onPress: () {
                        Get.back();
                          __.addContact();
                        })
                  ],
                ));
          },
          child: Icon(Icons.add),
        ),
      );
    });
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
