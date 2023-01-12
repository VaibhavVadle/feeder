import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {

  final bool? autoFocus;
  final Function(String)? onChanged;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final bool ObscureText;
  final FocusNode? focusNode;

  OtpField({
    this.textInputType = TextInputType.number,
    this.textAlign = TextAlign.center,
    this.ObscureText = true,
    this.onChanged,
    this.focusNode,
    this.autoFocus,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        autofocus: autoFocus!,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        obscureText: ObscureText,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
