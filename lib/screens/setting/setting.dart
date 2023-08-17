import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/screens/auth/login_screen.dart';
import 'package:khetikhata/screens/setting/pages/privacy.dart';
import 'package:khetikhata/screens/setting/pages/saved_news.dart';
import 'package:khetikhata/styles/textstyle_const.dart';
import 'package:khetikhata/utils/Utils.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    int selectedLanguage = 0; // Default selected language
    void onLanguageSelected(int? languageIndex) {
      setState(() {
        selectedLanguage = languageIndex ?? 0;
      });
    }

    List<String> names = [
      "Saved News",
      "Privacy",
      "Language",
      "Logout",
      "Delete Your Account",
      "App Version",
    ];
    List pages = [
      const SavedNews(),
      const Privacy(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary60,
        centerTitle: true,
        title: Text("Setting".tr),
      ),
      body: Column(
        children: [
          ListView.separated(
              shrinkWrap: true,
              itemCount: names.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1, // Adjust the height of the separator
                  color: AppColors.white40,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      if (index == 3 || index == 4) {
                        Utils.dialogBoxConfirm(
                            context,
                            "",
                            index == 3
                                ? "Are you sure want to logout?".tr
                                : "Are you sure to Permanently Delete Your Account?"
                                    .tr,
                            GestureDetector(
                              onTap: () {
                                Utils.nevergoTo(context, const LoginScreen());
                              },
                              child: ConstantContainer(
                                height: 30,
                                width: 80,
                                color: AppColors.primary60,
                                radiusBorder: 20,
                                child: Center(
                                  child: Text(
                                    index == 3 ? "Logout".tr : "Delete".tr,
                                    style: AppTextStyles
                                        .kBody15SemiboldTextStyle
                                        .copyWith(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ));
                      } else if (index == 2) {
                        Utils.constDialogBox(
                            context,
                            "Do you want to change your language?".tr,
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                RadioListTile(
                                    activeColor: AppColors.primary60,
                                    title: const Text("English"),
                                    value: 0,
                                    groupValue: selectedLanguage,
                                    onChanged: onLanguageSelected),
                                RadioListTile(
                                  activeColor: AppColors.primary60,
                                  title: const Text('हिंदी'),
                                  value: 1,
                                  groupValue: selectedLanguage,
                                  onChanged: onLanguageSelected,
                                ),
                              ],
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary60),
                                onPressed: () {
                                  var locale = selectedLanguage == 0
                                      ? const Locale('en', '')
                                      : const Locale('hi', '');
                                  Get.updateLocale(locale);
                                  Navigator.pop(context);
                                },
                                child: Text("Ok".tr)));
                      } else if (index <=1) {
                        Utils.goTo(context, pages[index]);
                      }
                    },
                    leading: Text(names[index].tr),
                    trailing: index < names.length - 1
                        ? const Icon(Icons.arrow_forward_ios)
                        : Text(
                            "1.0.8",
                            style: AppTextStyles.kBody15RegularTextStyle
                                .copyWith(color: AppColors.white60),
                          ));
              })
        ],
      ),
    );
  }

  logout(BuildContext context, text) {
    return Utils.dialogBoxConfirm(
        context,
        "",
        text,
        InkWell(
          onTap: () {
            Utils.nevergoTo(context, const LoginScreen());
          },
          child: ConstantContainer(
            color: AppColors.primary60,
            radiusBorder: 20,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Logout".tr,
                  style: AppTextStyles.kBody15RegularTextStyle
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ));
  }

  deleteAccount(BuildContext context) {
    return Utils.dialogBoxConfirm(
        context,
        "",
        "Are you sure to Permanently Delete Your Account?",
        InkWell(
          onTap: () {
            Utils.nevergoTo(context, const LoginScreen());
          },
          child: ConstantContainer(
            color: AppColors.primary60,
            radiusBorder: 20,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: Text(
                  "Logout".tr,
                  style: AppTextStyles.kBody15RegularTextStyle
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ));
  }
}
