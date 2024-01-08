import 'package:flutter/material.dart';

import '../../../../../../../Utils/Textstyles.dart';

// class OnlineSafetBulletWidget extends StatelessWidget {
//   final String text;
//   const OnlineSafetBulletWidget({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         vertical: 6,
//       ),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   '\u2022',
//                   style: TextStyle(fontSize: 22),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: RichText(
//                         text: TextSpan(
//                             text: '',
//                             style: Theme.of(context).textTheme.headlineLarge,
//                             children: [
//                           TextSpan(
//                             text: text,
//                             style: CustomTextStyles.descriptionTextStyle,
//                           ),
//                         ])),
//                   ),
//                 ),
//               ],
//             )
//           ]),
//     );
//   }
// }


class OnlineSafetBulletWidget extends StatelessWidget {

  final String text;
  const OnlineSafetBulletWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5,),
                Text(
                  '\u2022',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: CustomTextStyles.descriptionTextStyle,
                    ),
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }
}
