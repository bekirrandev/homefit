import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_dialog.dart';

class LocalNotification {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    var notifyToken = await FirebaseMessaging.instance.isSupported()
        ? await FirebaseMessaging.instance.getToken()
        : "notifyToken";
    print(notifyToken.toString());
    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      if (details.input != null) {}
    });
  }

  Future<void> display(RemoteMessage message) async {
    // To display the notification in device
    try {
      print(message.notification!.android!.sound);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            message.notification!.android!.sound ?? "Channel Id",
            message.notification!.android!.sound ?? "Main Channel",
            groupKey: "gfg",
            importance: Importance.max,
            sound: RawResourceAndroidNotificationSound(
                message.notification!.android!.sound ?? "gfg"),

            // different sound for
            // different notification
            playSound: true,
            priority: Priority.high),
      );
      await _notificationsPlugin.show(id, message.notification?.title,
          message.notification?.body, notificationDetails,
          payload: message.data['route']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void messageListener(BuildContext context) {
    // Either you can pass buildcontext or you
    // can take a context from navigator key
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification:  so it will pop up ${message.notification?.body}');
        showDialog(
            context: context,
            // context: navigatorKey!.currentContext!,
            builder: ((BuildContext context) {
              return DynamicDialog(
                  title: message.notification?.title,
                  body: message.notification?.body);
            }));
      }
    });
  }
}
