import 'package:flutter/material.dart';
import 'package:flutter_push_notification/manager/push_notification_manager.dart';
import 'package:flutter_push_notification/routes/routes.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationManager.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.homeRoute,
        getPages: Routes.routes,
      ),
    );
  }
}