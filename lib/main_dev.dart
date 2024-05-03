import 'package:cm_flutter/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {

    FlavorConfig(
      name: "DEVELOP",
      color: Colors.red,
      location: BannerLocation.bottomStart,
      variables: {
        "baseUrl": "https://crew.imatefx.com",
      });

  return runApp(const MyApp());
}
