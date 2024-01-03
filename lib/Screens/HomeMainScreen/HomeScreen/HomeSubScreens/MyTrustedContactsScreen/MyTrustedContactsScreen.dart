import 'package:b_safe/GlobalWidget/MyButton.dart';
import 'package:b_safe/GlobalWidget/MyTextField.dart';
import 'package:b_safe/Screens/HomeMainScreen/HomeScreen/HomeSubScreens/MyTrustedContactsScreen/MTCscreenWidget.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../Routs/RoutsNames.dart';
import '../../../HomeMainScreenController.dart';

class MyTrustedContactsScreen extends StatelessWidget {
  const MyTrustedContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMainScreenController>(builder: (__) {
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
          padding:  EdgeInsets.symmetric(
            horizontal: Get.width * .05
          ),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){
            return MTCscreenWidget(
              title: 'Lorem ipsum',
              subtitle: '093847474747',
              onTap: () {
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


