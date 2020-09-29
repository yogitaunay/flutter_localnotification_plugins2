// import 'package:android_alarm_manager/android_alarm_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:coba_app/screen/ccoba.dart';
//
// // void main() {
// //   runApp(MyApp());
// // }
//
// void main() async
// {
//   WidgetsFlutterBinding.ensureInitialized();
//   await AndroidAlarmManager.initialize();
//   runApp(MyApp());
// }

// import 'package:alarm_manager/notificationManager.dart';
import 'package:coba_app/alarmManager.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

NotificationManager n = NotificationManager();

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      title: 'Flutter Demo',
      theme: ThemeData
        (
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  void turnOnSignal() {
    AndroidAlarmManager.oneShot(
        Duration(seconds: 5),
        0,
        notificate,
        alarmClock: true,
        allowWhileIdle: true,
        exact: true,
        wakeup: true,
        rescheduleOnReboot: true
    );
  }
  @override
  void initState()
  {
    super.initState();
    // AndroidAlarmManager.oneShot(
    //     Duration(seconds: 5),
    //     0,
    //     notificate,
    //     alarmClock: true,
    //     allowWhileIdle: true,
    //     exact: true,
    //     wakeup: true,
    //     rescheduleOnReboot: true
    // );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
          title: Text(widget.title),
        ),
        body: Container
          (
          child: RaisedButton(
            child: Text('CobaAlarm'),
            onPressed: (){
              turnOnSignal();
            },),

        )
    );
  }
}

void notificate()
{
  n.initNotificationManager();
  n.showNotificationWithDefaultSound("MyTitle", "Body");
  return;
}