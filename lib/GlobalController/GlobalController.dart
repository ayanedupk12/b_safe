
import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/HomeMainScreen/HomeMainScreen.dart';
import '../Screens/SecurityScreen/SecurityScreen.dart';

class GlobalController extends GetxController{
 
  bool isSecurebool=false;
  bool val = false;
  int initialIndex=0;

  List<String> selectedLanguageList1=[
    "en",
    "pl",
    "sk"
  ];
  List<String> selectedLanguageList2=[
    "US",
    "PL"
    "SK"
  ];
  void selectLanguage(val){
    if(val == "Polish"){
      initialIndex=1;
      update();
    }else{
      initialIndex==0;
      update();
    }
  }
  void updateLocale(){
    Get.updateLocale(
        Locale(
          selectedLanguageList1[initialIndex],
          selectedLanguageList2[initialIndex],
        )
    );
  }

  Future<void> callPolice() async {
    const phoneNumber = '112'; // Your desired phone number
    const url = 'tel:$phoneNumber';
    {
      final URL = Uri.parse(url);
      if (!await launchUrl(URL)) {
    throw Exception('Could not launch $URL');
    }
  }
  }

  Future<void> updateSwitch(bool value) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // val = value;
    // if(value==true){
    //   prefs.setBool("isok", value);
    //   Get.to(SecurityScreen());
    //   print(value);
    // }else{
    //   Get.to(HomeMainScreen());
    //   prefs.setBool("isok", value);
    //   print(value);
    // }
    // update();
    // print(value);
  }


}