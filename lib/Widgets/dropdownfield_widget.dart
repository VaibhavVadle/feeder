import 'package:feeder/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownField<T> extends StatefulWidget {

  final void Function(dynamic) onChanged;
  final List<DropdownMenuItem> items;
  final IconData? startIcon;
  final IconData? endIcon;
  final bool? isDense;
  final double? iconSize;
  final T? defaultValue;

  CustomDropDownField({Key? key,
    required this.onChanged,
    required this.items,
    this.startIcon,
    this.endIcon = Icons.keyboard_arrow_down,
    this.isDense,
    this.iconSize,
    this.defaultValue,
  }
  ) : super(key: key);

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {

  String dropdownvalue = '1';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.defaultValue,
      items: widget.items,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.startIcon,
        size: widget.iconSize,
        color: Secondary,)
      ),
        isDense: widget.isDense!,
        icon: Icon(widget.endIcon),
    );
  }
}
