

import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/Globalmodels/ServicesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceScreen extends StatelessWidget {
  ServicesModel? servicesModel;
  ServiceScreen({super.key,required this.servicesModel});
  // static const LatLng _initialPosition = LatLng(37.4223, -122.0848);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(servicesModel!.name),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Card(child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call,size: 20,color: Colors.blue,),
                      SizedBox(width: 10,),
                      Text('Call'),
                    ],
                  ),
                ),),),
                SizedBox(width: 30,),
                Card(child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.web,size: 20,color: Colors.blue,),
                      SizedBox(width: 10,),
                      Text('Website'),
                    ],
                  ),
                ),),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
