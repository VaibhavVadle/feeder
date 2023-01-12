import 'package:feeder/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class  TextFormFieldWidget extends StatefulWidget {

  final TextInputType? textInputType;
  final bool? readOnly;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final FormFieldValidator? validate;
  final FocusNode? focusNode;
  final bool? obscureInput;
  final TextEditingController? controller;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final Color? prefixIconColor;
  final int? maxLines;
  final bool? isDense;
  final String? initialValue;
  void Function(String)? onChanged;

  TextFormFieldWidget(
      {Key? key,
        this.initialValue,
        this.onChanged,
        this.readOnly = false,
        this.isDense = false,
        this.maxLines = 1,
        this.hintText,
        this.labelText,
        this.suffixIcon,
        this.focusNode,
        this.onTap,
        this.validate,
        this.prefixIconColor,
        this.textInputType,
        this.obscureInput = false,
        this.controller,
        this.onSubmitField,
        this.onFieldTap,
        this.prefixIcon}) :
        super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly!,
      maxLines: widget.maxLines,
      controller: widget.controller,
      obscureText: widget.obscureInput!,
      keyboardType: widget.textInputType,
      validator: widget.validate,
      onTap: widget.onTap,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        isDense: widget.isDense,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: widget.prefixIcon!= null ? Icon(widget.prefixIcon,color:Secondary): null,
        prefixIconColor: widget.prefixIconColor,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        labelText: widget.labelText,
      ),
    );
  }
}
