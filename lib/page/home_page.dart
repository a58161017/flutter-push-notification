import 'package:flutter/material.dart';
import 'package:flutter_push_notification/page/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Welcome to example of push notification.'),
        ),
      ),
    );
  }
}
