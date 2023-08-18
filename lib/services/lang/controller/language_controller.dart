// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LanguageController extends GetxController {
//   static LanguageController to = Get.find();
//
//   var locale = const Locale('en', '');
//
//   void changeLanguage(Locale newLocale) async {
//     locale = newLocale;
//     await Get.updateLocale(locale);
//     await _saveLocale(newLocale);
//   }
//
//   Future<void> _saveLocale(Locale locale) async {
//     final preferences = await SharedPreferences.getInstance();
//     await preferences.setString('languageCode', locale.languageCode);
//   }
//
//   Future<void> _loadLocale() async {
//     final preferences = await SharedPreferences.getInstance();
//     final languageCode = preferences.getString('languageCode');
//     if (languageCode != null) {
//       locale = Locale(languageCode, '');
//       Get.updateLocale(locale);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadLocale();
//   }
// }
