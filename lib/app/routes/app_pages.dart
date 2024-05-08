import 'package:cm_flutter/app/modules/absense_manager/views/absense_manager_list_pg.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ABSENSE_MANAGER_LIST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ABSENSE_MANAGER_LIST,
      page: () => const AbsenseManagerListPage(),
      // binding: AbsenseManagerListBinding(),
    ),
  ];
}
