import 'package:get/get.dart';
import '../../Utils/AppConstants/English/HomeMainScreenConstantsE.dart';
import 'FindLocalHelpScreen/FindLocalHelpScreen.dart';
import 'HomeScreen/HomeScreen.dart';
import 'MyJournalScreen/MyJournalScreen.dart';

class HomeMainScreenController extends GetxController{

  int initialIndex=0;

  List<String> pageTitle=[
    HomeMainScreenContantsE.homeAppBarText.tr,
    HomeMainScreenContantsE.localSupportAppBarText.tr,
    HomeMainScreenContantsE.journalAppBarText.tr,
  ];

  List pagesList=[
     HomeScreen(),
     FindLocalHelpScreen(),
     MyJournalScreen(),
  ];

}