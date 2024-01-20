import 'package:flutter/material.dart';
import '../../../Utils/Textstyles.dart';

class FLHSwidget extends StatelessWidget {
  final String text;
  final String? position;
  const FLHSwidget({super.key, required this.text,  this.position});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 3,
      shadowColor: Colors.grey,
      child: ListTile(
        title: Text(text,style: CustomTextStyles.buttonTextStyleB,),
        subtitle: Text(position??'',style: CustomTextStyles.hintTextStyle),
      ),
    );
  }
}
