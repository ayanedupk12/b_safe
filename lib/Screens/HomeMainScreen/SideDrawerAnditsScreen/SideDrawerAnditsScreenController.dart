


import 'package:b_safe/Screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:b_safe/Screens/SecurityScreen/SecurityScreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideDrawerController extends GetxController{

   bool switchValue=false;
  void swithboolFromSharedpreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switchValue =pref.getBool('isSecure')??false;
  }



  void updateSwite() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switchValue = !switchValue;
    pref.setBool('isSecure', switchValue);
    if(switchValue==false){
      Get.to(HomeMainScreen());
    }else{
      Get.to(SecurityScreen());
    }
    update();
  }

}