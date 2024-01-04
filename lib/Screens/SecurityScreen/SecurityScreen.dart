import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:b_safe/Utils/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomeMainScreen/SideDrawerAnditsScreen/SideDrawerAnditsScreenController.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({super.key});
  final SideDrawerController sideDrewerController = Get.find<SideDrawerController>();

  List<Color> colorList = [
    Color(0xff1158AA).withOpacity(.8),
    Color(0xff92C5547).withOpacity(.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorList, // Replace with your desired colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [.3, 1], // You can set multiple stops for the gradient
            tileMode: TileMode
                .clamp, // How the gradient should be repeated, if at all
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * .05,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),

              ///container 1
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffA7A1C9).withOpacity(.4),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ///local weather report
                    ListTile(
                      title: Center(
                          child: Text(
                        "Local Weather Report",
                        style: CustomTextStyles.buttonTextStyle,
                      )),
                      trailing: InkWell(
                        onTap: (){
                          sideDrewerController.updateSwite();
                        },
                          child: const Icon(
                        Icons.sunny,
                        color: Colors.yellow,
                      )),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),

              ///container 2
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xffA7A1C9).withOpacity(.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Monday',
                                    style: CustomTextStyles.buttonTextStyle,
                                  ),
                                  Icon(
                                    Icons.sunny_snowing,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '22ºC\n71.6 ºF',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.buttonTextStyle,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
