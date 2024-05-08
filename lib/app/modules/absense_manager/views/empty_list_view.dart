import 'package:flutter/material.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({super.key, this.onClearFilterBtnClick});

  final VoidCallback? onClearFilterBtnClick;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Icon(
          Icons.hourglass_empty,
          size: 50,
        ),
        SizedBox(
          height: 10,
        ),
        Text("No Data Found!"),
        TextButton(
            onPressed: onClearFilterBtnClick,
            child: Text("Clear Filters"))
      ],
    ));
  }
}
