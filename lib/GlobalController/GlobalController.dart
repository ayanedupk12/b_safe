import 'dart:async';
import 'dart:ui';
import 'package:b_safe/Globalmodels/ServicesModel.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:b_safe/Utils/locationServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Routs/RoutsNames.dart';
import '../Screens/HomeMainScreen/HomeMainScreen.dart';
import '../Screens/SecurityScreen/SecurityScreen.dart';
import 'dart:math' as Math;

import '../Utils/AppConstants/EnglishConstants.dart';

class GlobalController extends GetxController {


  FirebaseAuth auth = FirebaseAuth.instance;

  bool switchValue = false;
  bool firstTime = false;
  String? countryUsage;

  List<String> languageList = [
    LCscreenConstantsE.english,
    LCscreenConstantsE.polish,
    LCscreenConstantsE.czcechL,
    LCscreenConstantsE.slovak,
    LCscreenConstantsE.ukrain,
  ];

  List<String> countryList = [
    LCscreenConstantsE.poland,
    LCscreenConstantsE.zcechC,
    LCscreenConstantsE.slovakia,
  ];
  String selectedCountry = "English";
  @override
  void onInit() async{
    super.onInit();
    switchValue = await checkSecurity() ?? false;
    selectedCountry = await checkSelectedLan() ?? LCscreenConstantsE.english;
    updateLocale(selectedCountry);
    checkappOpenFirstTimeOrnot();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String tempCountry= pref.getString('country')??'Poland';
    changeCountry(tempCountry);
  }

  void updateLocale(String selectedCountry) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    switch (selectedCountry) {
      case LCscreenConstantsE.polish:
        Get.updateLocale(const Locale('pl', 'PL'));
        preferences.setString("selectedCountry", LCscreenConstantsE.polish);
        break;
      case LCscreenConstantsE.english:
        Get.updateLocale(const Locale('en', 'US'));
        preferences.setString("selectedCountry", LCscreenConstantsE.english);
        break;
      case LCscreenConstantsE.czcechL:
        Get.updateLocale(const Locale('cs', 'CZ'));
        preferences.setString("selectedCountry", LCscreenConstantsE.czcechL);
        break;
      case LCscreenConstantsE.slovak:
        Get.updateLocale(const Locale('sk', 'SK'));
        preferences.setString("selectedCountry", LCscreenConstantsE.slovak);
        break;
      case LCscreenConstantsE.ukrain:
        Get.updateLocale(const Locale('uk', 'UA'));
        preferences.setString("selectedCountry", LCscreenConstantsE.ukrain);
        break;
      default:
        Get.updateLocale(const Locale('en', 'US'));
        break;
    }

    update();
  }

  checkSecurity() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isSecure');
  }
  checkSelectedLan() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('selectedCountry');
  }

  void checkappOpenFirstTimeOrnot() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    firstTime = pref.getBool('firstTime') ?? false;
  }



  languageButton() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('firstTime', true);
    print(pref.setBool('firstTime', true));
    Get.offAllNamed(RouteNames.loginScreen);
  }

  void splashServices() async {
    if (firstTime == false) {
      Get.offAllNamed(RouteNames.languageOrCountrySelectionScreen);
      update();
    } else if (auth.currentUser == null) {
      Get.offAllNamed(RouteNames.loginScreen);
      update();
    } else if (switchValue == false) {
      Get.offAllNamed(RouteNames.homeMainScreen);
      update();
    } else {
      Get.offAllNamed(RouteNames.securityScreen);
      update();
    }

    update();
  }

  void securityModeCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switchValue = pref.getBool('isSecure') ?? false;

    bool updatedSwitchValue = !switchValue;

    await pref.setBool('isSecure', updatedSwitchValue);

    switchValue = updatedSwitchValue;

    if (updatedSwitchValue == true) {
      Get.offAll(SecurityScreen())?.then((_) {
        update();
      });
    } else {
      Get.offAll(HomeMainScreen())?.then((_) {
        update();
      });
    }
  }
  Future<void> makeACall(String phone) async {
    var phoneNumber = phone; // Your desired phone number
    var url = 'tel:$phoneNumber';
    {
      final URL = Uri.parse(url);
      if (!await launchUrl(URL)) {
        throw Exception('Could not launch $URL');
      }
    }
  }
  Future<void> lunchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)){
      await launchUrl(uri);
    } else {
      showMessage('No Url Found');
      // can't launch url
    }

    // var phoneNumber = phone; // Your desired phone number
    // var url = 'tel:$phoneNumber';
    // {
    //   final URL = Uri.parse(url);
    //   if (!await launchUrl(URL)) {
    //     throw Exception('Could not launch $URL');
    //   }
    // }
  }


  //country change
  List<ServicesModel>? servicesList;
  List<ServicesModel>? backupServicesList;
  changeCountry(String country)async{
    countryUsage=country;
    if(country=='Poland'){
      servicesList=LocationsList().polandServices;
      backupServicesList=LocationsList().polandServices;
    }else if(country=='Czech Republic'){
      servicesList=LocationsList().czechRepublicServices;
      backupServicesList=LocationsList().czechRepublicServices;
    }else{
      servicesList=LocationsList().slovakiaServices;
      backupServicesList=LocationsList().slovakiaServices;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('country', country);
    update();
  }
  search(String query){
    List<ServicesModel> filteredservicesList = servicesList!
        .where((student) =>
        student.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if(query.length!=0){
      servicesList=filteredservicesList;
      update();
    }else{
      servicesList=backupServicesList;
      update();
    }
  }
  //maps
  // bool autoFocus=false;
  // LatLng? currentPosition;
  // Completer<GoogleMapController> mapController=Completer<GoogleMapController>();
  getAccessMicrophoneAndStorage()async{
    bool microPhoneAccess = await permission.Permission.microphone.isGranted;
    if(!microPhoneAccess){
      await permission.Permission.microphone.request();
    }
    bool cameraAccess = await permission.Permission.camera.isGranted;
    if(!cameraAccess){
      await permission.Permission.camera.request();
    }
    bool fileAccess = await permission.Permission.storage.isGranted;

    if(!fileAccess){
      await permission.Permission.storage.request();
    }
    if(await permission.Permission.microphone.isPermanentlyDenied){
      await  permission.openAppSettings();
    }
    if(await permission.Permission.camera.isPermanentlyDenied){
      await  permission.openAppSettings();
    }
    if(await permission.Permission.storage.isPermanentlyDenied){
      await  permission.openAppSettings();
    }
  }
  // void getCurrentLocation() async {
  //   try{
  //     // Ensure all permissions are collected for Locations
  //     Location _location = Location();
  //     bool? _serviceEnabled;
  //     PermissionStatus? _permissionGranted;
  //
  //     _serviceEnabled = await _location.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await _location.requestService();
  //     }
  //
  //     _permissionGranted = await _location.hasPermission();
  //     if (_permissionGranted == PermissionStatus.denied) {
  //       _permissionGranted = await _location.requestPermission();
  //     }
  //     _location.onLocationChanged.listen((LocationData locationData) async{
  //       if(locationData.latitude!=null&&locationData.longitude!=null){
  //         currentPosition=LatLng(locationData.latitude!, locationData.longitude!);
  //         if(autoFocus){
  //           await cameraPosition(currentPosition!);
  //         }
  //         update();
  //       }
  //     });
  //     // Get the current user location
  //     // LocationData _locationData = await _location.getLocation();
  //     // LatLng currentLocation =
  //     // LatLng(_locationData.latitude!, _locationData.longitude!);
  //
  //     // Get the current user address
  //     // String currentAddress =
  //     // (await getParsedReverseGeocoding(currentLocation))['place'];
  //     //
  //     // // Store the user location in sharedPreferences
  //     // sharedPreferences.setDouble('latitude', _locationData.latitude!);
  //     // sharedPreferences.setDouble('longitude', _locationData.longitude!);
  //     // sharedPreferences.setString('current-address', currentAddress);
  //     //
  //     // Navigator.pushAndRemoveUntil(context,
  //     //     MaterialPageRoute(builder: (_) => const Home()), (route) => false);
  //
  //   }catch(e){
  //
  //   }
  // }
  // cameraPosition(LatLng pos)async{
  //   final GoogleMapController controller= await mapController.future;
  //   CameraPosition newCamPostion=CameraPosition(target: pos,zoom: 13);
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(newCamPostion));
  //   update();
  // }

  // LocationServices findNearestLocation(List<LocationServices> locations, double currentLat, double currentLon) {
  //   if (locations.isEmpty) {
  //     throw Exception('The locations list is empty.');
  //   }
  //
  //   LocationServices nearestLocation = locations[0];
  //   double minDistance = haversineDistance(currentLat, currentLon, nearestLocation.latitude, nearestLocation.longitude);
  //
  //   for (int i = 1; i < locations.length; i++) {
  //     double distance = haversineDistance(currentLat, currentLon, locations[i].latitude, locations[i].longitude);
  //     if (distance < minDistance) {
  //       minDistance = distance;
  //       nearestLocation = locations[i];
  //     }
  //   }
  //
  //   return nearestLocation;
  // }
  // double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
  //   const double earthRadius = 6371; // Radius of Earth in kilometers
  //
  //   double dLat = _degreesToRadians(lat2 - lat1);
  //   double dLon = _degreesToRadians(lon2 - lon1);
  //
  //   double a = Math.pow(Math.sin(dLat / 2), 2) +
  //       Math.cos(_degreesToRadians(lat1)) * Math.cos(_degreesToRadians(lat2)) * Math.pow(Math.sin(dLon / 2), 2);
  //
  //   double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  //
  //   return earthRadius * c;
  // }
  //
  // double _degreesToRadians(double degrees) {
  //   return degrees * (Math.pi / 180);
  // }

}