import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../colors/colors_const.dart';
import 'community/explore_groups.dart';
import 'home/views/home_screen.dart';
import 'notifications/notification_screen.dart';
import 'profile/profile.dart';
import 'setting/setting.dart';

class BottomPage extends StatefulWidget {
   int currentIndex=0;
   BottomPage({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  bool pressed = false;
  final screen = [
    const HomeScreen(),
    const ExploreGroups(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: AppColors.primary60,
        centerTitle: true,
        title: Text("Kheti Khata".tr),
        actions: [
          IconButton(onPressed: (){
            Utils.goTo(context, const Setting());
          }, icon: const Icon(Icons.settings))
        ],
      ),
      body: screen[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        fixedColor: AppColors.primary60,
        unselectedFontSize: 10,
        unselectedItemColor: AppColors.neutralLightFonts,
        showUnselectedLabels: true,
        enableFeedback: true,
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.group),
            label: 'Community'.tr,
          ),
          BottomNavigationBarItem(
            icon:  const Icon(Icons.notifications_none_outlined),
            label: 'Notification'.tr,
          ),
          BottomNavigationBarItem(
            icon:  const Icon(CupertinoIcons.profile_circled),
            label: 'Profile'.tr,
          ),
        ],
        onTap: (index) =>
        {
          setState(() {
            widget.currentIndex = index;
            pressed = true;
          })
        },
      ),
    );
  }
}