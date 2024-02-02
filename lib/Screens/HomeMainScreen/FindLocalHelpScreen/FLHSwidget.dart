import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/Globalmodels/ServicesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/Textstyles.dart';

class FLHSwidget extends StatelessWidget {
  final ServicesModel servicesModel;
   FLHSwidget({super.key, required this.servicesModel,});
  final  globalController= Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.yellowAccent,
      elevation: 3,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(servicesModel.name,style: CustomTextStyles.descriptionTextStyle,),
          trailing: SizedBox(
            height: 50,
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    globalController.makeACall(servicesModel.contact);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.call,size: 20,color: Colors.blue,),
                      SizedBox(height: 5,),
                      Text('Call',style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    globalController.lunchUrl(servicesModel.website);
                  },
                  child: Column(
                    children: [
                      Icon(Icons.web,size: 20,color: Colors.green,),
                      SizedBox(height: 5,),
                      Text('Website',style: TextStyle(color: Colors.green),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
