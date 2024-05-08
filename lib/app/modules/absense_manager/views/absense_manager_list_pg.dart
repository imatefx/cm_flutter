import 'package:cm_flutter/app/modules/absense_manager/controllers/absense_manager_list_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsenseManagerListPage extends StatelessWidget {
  const AbsenseManagerListPage({Key? key}) : super(key: key);
  // const AbsenseManagerListPage({super.key});
  @override
  Widget build(context) {
    AbsenseManagerListController absenseManagerListController =
        Get.put(AbsenseManagerListController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Absense List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Hello"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: const Icon(Icons.filter_list_rounded)));
  }
}
