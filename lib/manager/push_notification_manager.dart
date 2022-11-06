import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/model/PushNotification.dart';
import 'package:flutter_push_notification/page/home_controller.dart';
import 'package:flutter_push_notification/page/home_page.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class PushNotificationManager {
  PushNotificationManager._();

  static final PushNotificationManager instance = PushNotificationManager._internal();

  PushNotificationManager._internal();
  List<PushNotification> pushNotificationList = [];

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      debugPrint('[FirebaseMessaging] getInitialMessage()');
      if (message != null) {
        _goToHomePage();
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('[FirebaseMessaging] onMessage()');
      final PushNotification? pushNotification = _convertToPushNotification(message);
      if (pushNotification != null) {
        pushNotificationList.add(pushNotification);

        showSimpleNotification(
          Text(pushNotification.title),
          subtitle: Text(pushNotification.body),
          duration: const Duration(seconds: 5),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('[FirebaseMessaging] onMessageOpenedApp()');
      _goToHomePage();
    });

    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  PushNotification? _convertToPushNotification(RemoteMessage message) {
    debugPrint('[FirebaseMessaging] _convertToPushNotification()');
    debugPrint('[FirebaseMessaging] message.data: ${message.data.toString()}');
    if (message.notification == null) return null;
    debugPrint('[FirebaseMessaging] message.notification.title: ${message.notification!.title}');
    debugPrint('[FirebaseMessaging] message.notification.body: ${message.notification!.body}');
    return PushNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      data: message.data,
      receiveDateTime: message.sentTime ?? DateTime.now(),
    );
  }
}

void _goToHomePage() {
  Get.offAll(() => const HomePage(), binding: HomeBinding());
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  debugPrint('[FirebaseMessaging] onBackgroundMessage()');
  await Firebase.initializeApp();
  _goToHomePage();
}
