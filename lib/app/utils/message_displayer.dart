import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDisplayer {
  static void apiFailureMessageDisplay(Exception exception) {
    Get.showSnackbar(GetSnackBar(
      title: "Error",
      message: 'Something went wrong: $exception',
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }

  static void validationFailureMessageDisplay(Exception exception) {
    Get.showSnackbar(GetSnackBar(
      title: "Error",
      message: 'Something went wrong: $exception',
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }

  static void networkFailureMessageDisplay(Exception exception) {
    Get.showSnackbar(GetSnackBar(
      title: "Network Error",
      message: 'Please check your internet connection: $exception',
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }

  static void showSuccessSnackbar({String title="Success", String message=""}){
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
    ));
  }
}
