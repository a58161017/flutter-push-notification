import 'package:flutter_push_notification/model/PushNotification.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

class HomeController extends GetxController {

}