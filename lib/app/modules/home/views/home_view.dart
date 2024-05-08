import 'package:cm_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue,
        ),
        onPressed: () {
          Get.toNamed(Routes.ABSENSE_MANAGER_LIST);
        },
        child: Text('TextButton'),
      )
          // Text(
          //      'HomeView is working',
          //      style: TextStyle(fontSize: 20),
          //    ),
          ),
    );
  }
}
