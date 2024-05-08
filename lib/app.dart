import 'package:cm_flutter/app/modules/home/views/home_view.dart';
import 'package:cm_flutter/app/routes/app_pages.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      color: Colors.blue,
      location: BannerLocation.topEnd,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: FlexThemeData.light(
            scheme: FlexScheme.orangeM3, useMaterial3: true),
        darkTheme:
            FlexThemeData.dark(scheme: FlexScheme.orangeM3, useMaterial3: true),
        themeMode: ThemeMode.system,
        // home: const HomeView(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
