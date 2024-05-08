import 'package:flutter/material.dart';

class CustomDatepickerBtnView extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? label ;
  const CustomDatepickerBtnView({super.key, this.onTap , this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
          labelPadding: const EdgeInsets.all(8.0),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(label??''),
              const SizedBox(
                width: 10.0,
              ),
              Icon(Icons.calendar_month_outlined),
            ],
          )),
    );
  }
}
