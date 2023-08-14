import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/screens/auth/login_screen.dart';
import 'package:khetikhata/screens/setting/pages/change_lang.dart';
import 'package:khetikhata/screens/setting/pages/privacy.dart';
import 'package:khetikhata/screens/setting/pages/saved_news.dart';
import 'package:khetikhata/styles/textstyle_const.dart';
import 'package:khetikhata/utils/Utils.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List names = [
      "Saved News",
      "Language",
      "Privacy",
      "Logout",
      "Delete Your Account",
      "App Version",
    ];
    List pages = [
      SavedNews(),
      ChangeLang(),
      Privacy(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary60,
        centerTitle: true,
        title: const Text("Setting"),
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
                        Utils.DialogBoxConfirm(
                            context,
                            "",
                            index == 3
                                ? "Are you sure want to logout?"
                                : "Are you sure to Permanently Delete Your Account?",
                            GestureDetector(
                              onTap: () {
                                Utils.nevergoTo(context, LoginScreen());
                              },
                              child: ConstantContainer(
                                height: 30,
                                width: 80,
                                color: AppColors.primary60,
                                radiusBorder: 20,
                                child: Center(
                                  child: Text(
                                    index == 3 ? "Logout" : "Delete",
                                    style: AppTextStyles
                                        .kBody15SemiboldTextStyle
                                        .copyWith(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ));
                      } else if (index <= 2) {
                        Utils.goTo(context, pages[index]);
                      }
                    },
                    leading: Text(names[index]),
                    trailing: index < names.length - 1
                        ? Icon(Icons.arrow_forward_ios)
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
    return Utils.DialogBoxConfirm(
        context,
        "",
        text,
        InkWell(
          onTap: () {
            Utils.nevergoTo(context, LoginScreen());
          },
          child: ConstantContainer(
            color: AppColors.primary60,
            radiusBorder: 20,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Logout",
                  style: AppTextStyles.kBody15RegularTextStyle
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ));
  }

  deleteAccount(BuildContext context) {
    return Utils.DialogBoxConfirm(
        context,
        "",
        "Are you sure to Permanently Delete Your Account?",
        InkWell(
          onTap: () {
            Utils.nevergoTo(context, LoginScreen());
          },
          child: ConstantContainer(
            color: AppColors.primary60,
            radiusBorder: 20,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: Text(
                  "Logout",
                  style: AppTextStyles.kBody15RegularTextStyle
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ));
  }
}
