import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/GlobalWidget/MyTextField.dart';
import 'package:b_safe/Screens/HomeMainScreen/FindLocalHelpScreen/mapScreen.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../Globalmodels/ServicesModel.dart';
import '../../../Utils/AppConstants/EnglishConstants.dart';
import '../../../Utils/locationServices.dart';
import 'FLHSwidget.dart';

class FindLocalHelpScreen extends StatelessWidget {
  const FindLocalHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .05,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            size2(),
            MyTextField(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: FLscreenConstantsE.hintText.tr,
              suffixIcon: const Icon(Icons.menu),
            ),
            size2(),
            Text(
              FLscreenConstantsE.title.tr,
              style: CustomTextStyles.topicTextStyle,
            ),
            size2(),
            GetBuilder<GlobalController>(
              builder: (__) {
                return ListView.builder(
                  itemCount: __.servicesList!.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx,index){
                      return InkWell(
                        onTap: (){
                          LocationServices? nearestLocation;
                          if(__.servicesList![index].length!=1){
                            final globalController = Get.find<GlobalController>();
                             nearestLocation = globalController.findNearestLocation(
                              (LocationsList().czechRepublicServices[index] as List<LocationServices>),
                                  // .expand((list) => list)
                                  // .toList(),
                              globalController.currentPosition?.latitude??0,
                              globalController.currentPosition?.longitude??0,
                            );
                          }else{
                            nearestLocation=__.servicesList![index].first;
                          }


                          Get.to(MapScreen(name: nearestLocation.name,
                          destinantion: LatLng(nearestLocation.latitude,nearestLocation.longitude,
                          ),
                              currentPosition:__.currentPosition
                          ));
                        },
                        child: FLHSwidget(
                          text: __.servicesList![index].first.name,
                          // position: 'longitude: '+LocationsList().czechRepublicServices[index].first.longitude.toString()+'\nlatitude: '+LocationsList().czechRepublicServices.first.first.latitude.toString(),
                        ),
                      );
                    });
              }
            ),

            // FLHSwidget(
            //   text: FLscreenConstantsE.text2.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text3.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text4.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text5.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text5.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text5.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text5.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            // FLHSwidget(
            //   text: FLscreenConstantsE.text5.tr,
            //   number: FLscreenConstantsE.number,
            // ),
            size2(),
            size2(),
            size2(),
            size2(),
            size2(),
            size2(),
            size2(),
          ],
        ),
      ),
    );
  }
}

size1() {
  return const SizedBox(
    height: 10,
  );
}
size2() {
  return const SizedBox(
    height: 15,
  );
}
