


import 'package:get/get.dart';

class SideDrewerController extends GetxController{
  bool val = false;

  void updateSwite(){
    if(val==false){
      val=false;
      update();
    }else{
      val=true;
      update();
    }
  }
}