import 'package:flutter/material.dart';

import '../../../../../../../Utils/Textstyles.dart';

class OnlineSafetyWidget extends StatelessWidget {
  final String title;
  final String number;
  const OnlineSafetyWidget(
      {super.key,
        required this.title,
        required this.number,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: RichText(
          text: TextSpan(
              text: '',
              style: Theme.of(context).textTheme.displayMedium,
              children: [
                TextSpan(text: "${number}. ", style: CustomTextStyles.descriptionTextStyleB),
                TextSpan(text: title, style: CustomTextStyles.descriptionTextStyleB),
                TextSpan(text: ':', style: CustomTextStyles.descriptionTextStyle),
              ])),
    );
  }
}

