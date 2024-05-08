import 'package:flutter/material.dart';

class CustomDropdownBtnView extends StatelessWidget {
  CustomDropdownBtnView({super.key, this.currentValue, this.onChanged, required this.values});
  final String? currentValue ;
  final ValueChanged<String?>? onChanged;
   List<String> values = <String>[] ;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.all(8.0),
      label: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text("Select Type"),
          value: currentValue,
          items:
          values.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          isDense: true,
        ),
      ),
    );
  }
}
