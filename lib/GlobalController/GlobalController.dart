import 'dart:async';

import 'package:b_safe/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:b_safe/Screens/LanguageOrCountrySelectionScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Routs/RoutsNames.dart';
import '../Screens/HomeMainScreen/HomeMainScreen.dart';
import '../Screens/SecurityScreen/SecurityScreen.dart';

class GlobalController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;

  bool switchValue = false;
  bool firstTime = false;

  @override
  void onInit() async{
    super.onInit();
    switchValue = await checkSecurity();
    checkappOpenFirstTimeOrnot();
  }

  checkSecurity() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isSecure') ?? false;
  }

  void checkappOpenFirstTimeOrnot() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    firstTime = pref.getBool('firstTime') ?? false;
  }

  languageButton() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('firstTime', true);
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



  //maps
  LatLng? currentPosition;
  Completer<GoogleMapController> mapController=Completer<GoogleMapController>();
  void getCurrentLocation() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }
    _location.onLocationChanged.listen((LocationData locationData) async{
      if(locationData.latitude!=null&&locationData.longitude!=null){
        currentPosition=LatLng(locationData.latitude!, locationData.longitude!);
        await cameraPosition(currentPosition!);
        update();
      }
    });
    // Get the current user location
    // LocationData _locationData = await _location.getLocation();
    // LatLng currentLocation =
    // LatLng(_locationData.latitude!, _locationData.longitude!);

    // Get the current user address
    // String currentAddress =
    // (await getParsedReverseGeocoding(currentLocation))['place'];
    //
    // // Store the user location in sharedPreferences
    // sharedPreferences.setDouble('latitude', _locationData.latitude!);
    // sharedPreferences.setDouble('longitude', _locationData.longitude!);
    // sharedPreferences.setString('current-address', currentAddress);
    //
    // Navigator.pushAndRemoveUntil(context,
    //     MaterialPageRoute(builder: (_) => const Home()), (route) => false);
  }
  cameraPosition(LatLng pos)async{
    final GoogleMapController controller= await mapController.future;
    CameraPosition newCamPostion=CameraPosition(target: pos,zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newCamPostion));
    update();
  }

}