import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/screens/bottom_nav_bar_pages/home/views/home_screen.dart';
import 'package:khetikhata/screens/bottom_nav_bar_pages/notifications/notification_screen.dart';
import 'package:khetikhata/screens/setting/setting.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../colors/colors_const.dart';
import 'bottom_nav_bar_pages/community/explore_groups.dart';
import 'bottom_nav_bar_pages/profile/profile.dart';

class Bottom_Page extends StatefulWidget {
   int currentindex=0;
   Bottom_Page({Key? key, required this.currentindex}) : super(key: key);

  @override
  State<Bottom_Page> createState() => _Bottom_PageState();
}

class _Bottom_PageState extends State<Bottom_Page> {
  bool pressed = false;
  // currentindex = 0;
  final Screen = [
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
      body: Screen[widget.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentindex,
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
            widget.currentindex = index;
            pressed = true;
          })
        },
      ),
    );
  }
}