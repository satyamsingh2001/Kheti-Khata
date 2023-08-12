import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/styles/textstyle_const.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List names =[
      "Saved News",
      "Language",
      "Privacy",
      "Logout",
      "Delete Your Account",
      "App Version",
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
                  leading: Text(names[index]),
                  trailing: index<names.length-1?Icon(Icons.arrow_forward_ios):Text("1.0.8",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white60),)
                );
              })
        ],
      ),
    );
  }
}
