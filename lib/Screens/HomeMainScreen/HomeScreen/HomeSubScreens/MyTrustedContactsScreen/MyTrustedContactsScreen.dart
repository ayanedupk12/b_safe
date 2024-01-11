import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/GlobalWidget/MyButton.dart';
import 'package:b_safe/GlobalWidget/MyTextField.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/MyTrustedContactsScreen/MTCscreenWidget.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Routs/RoutsNames.dart';
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
            "My Trusted Contacts",
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
                                      controller: __.newName,
                                    ),
                                    height2(),
                                    MyTextField(
                                      controller: __.newPhone,
                                    ),
                                    height2(),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: MyButton(
                                            loading: __.loading,
                                            title: 'Edit',
                                            onPress: () {
                                              // Check if changes have been made
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.defaultDialog(
                title: "Add My Trusted Contacts",
                titleStyle: CustomTextStyles.logoStyle,
                titlePadding:
                    const EdgeInsets.only(left: 25, right: 25, top: 20),
                contentPadding: const EdgeInsets.all(20),
                content: Column(
                  children: [
                    MyTextField(
                      controller: __.name,
                      height: 50,
                      hintText: 'Name i.e Alex...',
                    ),
                    height2(),
                    MyTextField(
                      keyboardType: TextInputType.phone,
                      controller: __.phone,
                      height: 50,
                      hintText: '03XXXXXXXXXX',
                    ),
                    height2(),
                    MyButton(
                        loading: __.loading,
                        title: 'Add',
                        onPress: () {
                          __.addContact();
                        })
                  ],
                ));
          },
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.add),
              Text('Add new Contact'),
            ],
          ),
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
