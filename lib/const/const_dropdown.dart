import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import '../styles/textstyle_const.dart';

class ConstantDropdown extends StatefulWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged onChanged;
  final Color iconColor;
  final Color dropdownColor;
  final Color textColor;
  final FormFieldValidator? validator;
  final String? hint;

  ConstantDropdown({
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.iconColor,
    required this.dropdownColor,
    required this.textColor,
    this.validator,
    this.hint,
  });

  @override
  State<ConstantDropdown> createState() => _ConstantDropdownState();
}

class _ConstantDropdownState extends State<ConstantDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: widget.validator,
        dropdownColor: widget.dropdownColor,
        value: widget.selectedOption,
        onChanged: widget.onChanged,
        icon: const Icon(CupertinoIcons.chevron_down),
        iconSize: 15,
        iconEnabledColor: widget.iconColor,
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                value,
                style: AppTextStyles.kBody15SemiboldTextStyle
                    .copyWith(color: widget.textColor),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
