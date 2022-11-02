import 'package:flutter_push_notification/page/home_controller.dart';
import 'package:flutter_push_notification/page/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  Routes._();

  static const String homeRoute = '/home';

  static final List<GetPage> routes = [
    GetPage(
      name: homeRoute,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
