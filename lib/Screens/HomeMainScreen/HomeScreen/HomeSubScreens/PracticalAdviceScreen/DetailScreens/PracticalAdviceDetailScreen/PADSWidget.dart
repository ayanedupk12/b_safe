import 'package:flutter/material.dart';

import '../../../../../../../Utils/Textstyles.dart';

class PADSWidget extends StatelessWidget {
  final String title;
  final String description;
  const PADSWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\u2022',
                  style: TextStyle(
                      fontSize: 22
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: RichText(
                        text: TextSpan(
                            text: '',
                            style: Theme.of(context).textTheme.headlineLarge,
                            children: [
                              TextSpan(text: title, style: CustomTextStyles.descriptionTextStyleB),
                              TextSpan(text: ' : ', style: CustomTextStyles.topicTextStyle),
                              TextSpan(text: description, style: CustomTextStyles.descriptionTextStyle)
                            ])),
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }
}