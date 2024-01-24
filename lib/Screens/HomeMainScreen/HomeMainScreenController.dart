import 'package:get/get.dart';
import '../../GlobalWidget/toastMessage.dart';
import '../../Utils/AppConstants/EnglishConstants.dart';
import 'FindLocalHelpScreen/FindLocalHelpScreen.dart';
import 'HomeScreen/HomeScreen.dart';
import 'MyJournalScreen/MyJournalScreen.dart';

class HomeMainScreenController extends GetxController{
  DateTime currentBackPressTime = DateTime.now();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      toastmessage('Press Again to Exit'); // you can use snackbar too here
      return Future.value(false);
    }
    return Future.value(true);
  }

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