import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(color: AppColors.lightgrey),
        value: value,
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        });
  }
}
