import 'package:feeder/Theme/app_colors.dart';
import 'package:feeder/Theme/textStyle.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  SubmitButton(
      {Key? key,
      required this.text,
      this.icon,
      this.bgColor = Primary,
      this.textStyle,
      this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callBack,
      child: Text(
        text,
        style: textStyle != null ? textStyle : mTextStyle16,
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 14),
          backgroundColor: bgColor!=null ? bgColor : Color(0xffFE724C)),
    );
  }
}
