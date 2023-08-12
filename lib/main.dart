import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/screens/choose_lang_page.dart';
import 'lang/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale:Locale('en_US'),
      title: 'Language Integration',
      home: ChooseLang(),
    );
  }
}


