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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return MTCscreenWidget(
                  title: 'help line',
                  subtitle: '0xxxxxxxxx',
                  onTap: () {
                    // Get.defaultDialog(
                    //     title: "What do you want?",
                    //     titleStyle: CustomTextStyles.logoStyle,
                    //     titlePadding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                    //     contentPadding: const EdgeInsets.all(20),
                    //     content: Column(
                    //       children: [
                    //         MyButton(
                    //             loading: __.loading,
                    //             title: 'Delete', onPress: () {
                    //           Get.back();
                    //         }),
                    //         height2(),
                    //         MyButton(
                    //             loading: __.loading,
                    //             title: 'Edit', onPress: () {
                    //           Get.back();
                    //         }),
                    //         height2(),
                    //         MyButton(
                    //             loading: __.loading,
                    //             title: 'Cancel', onPress: () {
                    //           Get.back();
                    //         }),
                    //       ],
                    //     ));
                  },
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Add My Trusted Contacts",
                titleStyle: CustomTextStyles.logoStyle,
                titlePadding: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
                        title: 'Add', onPress: () {
                          Get.back();
                      ///__.addContact();
                    })
                  ],
                ));
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}




height2(){
  return SizedBox( height:  Get.height * .02,);
}
height5(){
  return SizedBox( height:  Get.height * .05,);
}

///back///
//return GetBuilder<MTCcontroller>(builder: (__) {
//       return Scaffold(
//         backgroundColor: AppColors.backGroundColor,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "My Trusted Contacts",
//             style: CustomTextStyles.appBarTextStyle,
//           ),
//           leading: IconButton(
//               onPressed: () {
//                 Get.offAllNamed(RouteNames.homeMainScreen);
//               },
//               icon: const Center(child: Icon(Icons.arrow_back_ios))),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
//           child: __.contactModelList.isEmpty
//             ?const Center(child: CircularProgressIndicator(),)
//               :ListView.builder(
//               itemCount: __.contactModelList.length,
//               itemBuilder: (context, index) {
//                 return MTCscreenWidget(
//                   title: __.contactModelList[index].name,
//                   subtitle: __.contactModelList[index].phoneNumber,
//                   onTap: () {
//                     Get.defaultDialog(
//                         title: "What do you want?",
//                         titleStyle: CustomTextStyles.logoStyle,
//                         titlePadding: const EdgeInsets.only(left: 25, right: 25, top: 20),
//                         contentPadding: const EdgeInsets.all(20),
//                         content: Column(
//                           children: [
//                             MyButton(
//                                 loading: __.loading,
//                                 title: 'Delete', onPress: () {
//                                   Get.back();
//                             }),
//                             height2(),
//                             MyButton(
//                                 loading: __.loading,
//                                 title: 'Edit', onPress: () {
//                                   Get.back();
//                             }),
//                             height2(),
//                             MyButton(
//                                 loading: __.loading,
//                                 title: 'Cancel', onPress: () {
//                                   Get.back();
//                             }),
//                           ],
//                         ));
//                   },
//                 );
//               }),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Get.defaultDialog(
//                 title: "Add My Trusted Contacts",
//                 titleStyle: CustomTextStyles.logoStyle,
//                 titlePadding: const EdgeInsets.only(left: 25, right: 25, top: 20),
//                 contentPadding: const EdgeInsets.all(20),
//                 content: Column(
//                   children: [
//                     MyTextField(
//                       controller: __.name,
//                       height: 50,
//                       hintText: 'Name i.e Alex...',
//                     ),
//                     height2(),
//                     MyTextField(
//                       keyboardType: TextInputType.phone,
//                       controller: __.phone,
//                       height: 50,
//                       hintText: '03XXXXXXXXXX',
//                     ),
//                    height2(),
//                     MyButton(
//                         loading: __.loading,
//                         title: 'Add', onPress: () {
//                       __.addContact();
//                     })
//                   ],
//                 ));
//           },
//           child: const Icon(Icons.add),
//         ),
//       );
//     });