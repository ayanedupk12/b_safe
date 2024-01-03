
import 'dart:ui';
import 'package:b_safe/Screens/HomeMainScreen/SideDrawerAnditsScreen/SideDrawerAnditsScreenController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/HomeMainScreen/HomeMainScreen.dart';
import '../Screens/SecurityScreen/SecurityScreen.dart';

class GlobalController extends GetxController{
  SideDrewerController SD =Get.put(SideDrewerController());

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

  void IsSecureModeokorNot(){
    if(SD.switchValue==false){
      Get.to(HomeMainScreen());
    }else{
      Get.to(SecurityScreen());
    }
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

}