import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:homemady_drivers/services/notification_service.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
  );
  await NotificationService().initializeNotification();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return OverlaySupport.global(

      child: GetMaterialApp(
        title: 'HomeMady Driver',
        theme: ThemeData(
          fontFamily: 'poppinsSans',
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: MyRouters.route,
      ),
    );
  }
}
