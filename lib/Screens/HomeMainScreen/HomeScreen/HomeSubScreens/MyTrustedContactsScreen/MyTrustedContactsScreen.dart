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
              icon: Center(child: Icon(Icons.arrow_back_ios))),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return MTCscreenWidget(
                  title: 'Lorem ipsum',
                  subtitle: '093847474747',
                  onTap: () {
                    Get.defaultDialog(
                        title: "Add My Trusted Contacts",
                        titleStyle: CustomTextStyles.logoStyle,
                        titlePadding:
                            const EdgeInsets.only(left: 25, right: 25, top: 20),
                        contentPadding: EdgeInsets.all(20),
                        content: Column(
                          children: [
                            MyTextField(
                              controller: __.name,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            MyTextField(
                              controller: __.phone,
                            ),
                            MyButton(
                              loading: __.loading,
                                title: 'Add',
                                onPress: () {
                                  __.addContact();
                                })
                          ],
                        ));
                  },
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Add My Trusted Contacts",
                titleStyle: CustomTextStyles.logoStyle,
                titlePadding: EdgeInsets.only(left: 25, right: 25, top: 20),
                contentPadding: EdgeInsets.all(20),
                content: Column(
                  children: [
                    MyTextField(),
                    SizedBox(
                      height: 5,
                    ),
                    MyTextField(),
                    MyButton(title: 'Add', onPress: () {})
                  ],
                ));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
