import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/choose_lang_page.dart';
import 'services/lang/languages.dart';
import 'services/notifications_services/local_notifications.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(message.data.toString());
  print(message.notification!.title);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale:const Locale('en_US'),
      home: const ChooseLang(),
    );
  }
}


