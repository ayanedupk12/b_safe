import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/IconsPaths.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'HomeMainScreenController.dart';
import 'SideDrawerAnditsScreen/MyDrawerWidget.dart';

class HomeMainScreen extends StatelessWidget {
  HomeMainScreen({super.key});

  HomeMainScreenController homeMainScreenController =
      Get.put(HomeMainScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMainScreenController>(builder: (__) {
      return WillPopScope(
        onWillPop: () async {
          await SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          drawer: __.initialIndex == 0
              ?  MyDrawerWidget()
              : null,
          appBar: AppBar(
            automaticallyImplyLeading: __.initialIndex == 0 ? true : false,
            title: Text(
              __.pageTitle[__.initialIndex],
              style: CustomTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: __.pagesList[__.initialIndex],
          bottomSheet: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * .15,
                vertical: Get.height * .01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        __.initialIndex = 0;
                        __.update();
                      },
                      icon: Image.asset(
                        AppIcons.homeicons,
                        width: 24,
                        height: 24,
                        color: __.initialIndex==0?AppColors.main2Coclor:Colors.grey,
                      )
                  ),
                  IconButton(
                      onPressed: () {
                        __.initialIndex = 1;
                        __.update();
                      },
                      icon: Image.asset(
                        AppIcons.customerService,
                        width: 24,
                        height: 24,
                        color: __.initialIndex==1?AppColors.main2Coclor:Colors.grey,
                      )
                  ),
                  IconButton(
                      onPressed: () {
                        __.initialIndex = 2;
                        __.update();
                      },
                      icon: Image.asset(
                        AppIcons.journalIcon,
                        width: 24,
                        height: 24,
                        color: __.initialIndex==2?AppColors.main2Coclor:Colors.grey,
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
