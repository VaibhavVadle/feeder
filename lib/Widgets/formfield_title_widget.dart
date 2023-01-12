import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
class TitleText extends StatelessWidget {
  final String title;

  const TitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Poppins',
              color: GreyDark,
              fontSize: 12),
        ),
      ],
    );
  }
}
