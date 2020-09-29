import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager
{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  AndroidInitializationSettings initializationSettingsAndroid;
  IOSInitializationSettings initializationSettingsIOS;
  InitializationSettings initializationSettings;

  void initNotificationManager()
  {
    initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettingsIOS = new IOSInitializationSettings();
    initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotificationWithDefaultSound(String title, String body)
  {
    var insistentFlag = 4;
    // var androidPlatformChannelSpecifics = new AndroidNotificationDetails('your channel id', 'your channel name', 'your channel description', importance: Importance.Max, priority: Priority.High);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'big text channel id',
        'big text channel name',
        'big text channel description',
        playSound: true,
        sound: RawResourceAndroidNotificationSound('begentle'),
        importance: Importance.Max,
        priority: Priority.High,
        additionalFlags: Int32List.fromList([insistentFlag]));
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
  }
}