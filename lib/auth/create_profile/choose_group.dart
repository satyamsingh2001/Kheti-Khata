import 'package:flutter/material.dart';
import 'package:khetikhata/bottom_nav_bar_pages/bottom_nav_bar.dart';
import 'package:khetikhata/utils/Utils.dart';
import 'package:get/get.dart';

import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';

class ChooseGroup extends StatefulWidget {
  const ChooseGroup({Key? key}) : super(key: key);

  @override
  State<ChooseGroup> createState() => _ChooseGroupState();
}

class _ChooseGroupState extends State<ChooseGroup> {
  Set<int> _selectedGroupIndices = {}; // Initialize with no selections

  void _handleGroupSelected(int index) {
    setState(() {
      if (_selectedGroupIndices.contains(index)) {
        _selectedGroupIndices.remove(index);
      } else {
        _selectedGroupIndices.add(index);
      }
    });
  }

  void _handleSubmit() {
    if (_selectedGroupIndices.isNotEmpty) {
      Utils.nevergoTo(context, BottomPage(currentIndex: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Select Group".tr,
                      style: AppTextStyles.kBody20SemiboldTextStyle
                          .copyWith(color: AppColors.white100),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "select atleast one group".tr,
                      style: AppTextStyles.kBody15RegularTextStyle
                          .copyWith(color: AppColors.white70, wordSpacing: 2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: _selectedGroupIndices.isNotEmpty ? _handleSubmit : null,
                        child: ConstantContainer(
                          height: size.height * 0.04,
                          width: size.width * 0.15,
                          radiusBorder: 20,
                          borderColor: AppColors.white100,
                          color: _selectedGroupIndices.isNotEmpty ? AppColors.primary60 : AppColors.white50,
                          child: Center(
                            child: Text(
                              "next".tr,
                              style: AppTextStyles.kBody15SemiboldTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstantContainer(
                        borderColor: _selectedGroupIndices.contains(index)
                            ? AppColors.primary60
                            : AppColors.white60,
                        borderWidth: _selectedGroupIndices.contains(index) ? 1.5 : 1,
                        radiusBorder: 10,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onTap: () {
                            _handleGroupSelected(index);
                          },
                          tileColor: AppColors.primary10,
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw"),
                          ),
                          title: Text(
                            "message".tr,
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white100),
                          ),
                          subtitle: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ConstantContainer(
                                  height: 20,
                                  width: 50,
                                  color: AppColors.white,
                                  radiusBorder: 10,
                                  child: Center(
                                      child: Text(
                                        "Social".tr,
                                        style: AppTextStyles
                                            .kCaption12SemiboldTextStyle
                                            .copyWith(
                                            color: AppColors.white100),
                                      )),
                                ),
                              ),
                               Text(
                                "36${"day ago".tr}",
                                style: AppTextStyles
                                    .kSmall10RegularTextStyle,
                              )
                            ],
                          ),
                          trailing: _selectedGroupIndices.contains(index)
                              ? const Icon(
                            Icons.check_circle_outline_outlined,
                            color: AppColors.white100,
                          )
                              : const Icon(
                            Icons.circle_outlined,
                            color: AppColors.primary60,
                          ),
                        ),
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstantContainer(
                        borderColor: _selectedGroupIndices.contains(index)
                            ? AppColors.primary60
                            : AppColors.white60,
                        borderWidth: _selectedGroupIndices.contains(index) ? 1.5 : 1,
                        radiusBorder: 10,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onTap: () {
                            _handleGroupSelected(index);
                          },
                          tileColor: AppColors.white30,
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://imgs.search.brave.com/PfcJM9Qx2yB5UksFZ0p9peQjMlaRTZbqCPA50ntWTiM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvODYz/NDczNzk2L3Bob3Rv/L2EtOC1tb250aHMt/YmFieS1naXJsLXNt/aWxpbmcuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPW44NHhj/S0hKeE5Yc0lIdFcw/UHdJRTVyeFh3LTFM/RWdfUXp5VFVIcEFS/T3c9"),
                          ),
                          title: Text(
                            "message".tr,
                            style: AppTextStyles.kBody17SemiboldTextStyle
                                .copyWith(color: AppColors.white100),
                          ),
                          subtitle: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ConstantContainer(
                                  height: 20,
                                  // width: 50,
                                  color: AppColors.white,
                                  radiusBorder: 10,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "Buy-Sell".tr,
                                        style: AppTextStyles
                                            .kCaption12RegularTextStyle
                                            .copyWith(
                                            color: AppColors.info40),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "36${"Members".tr}",
                                style: AppTextStyles
                                    .kCaption12RegularTextStyle
                                    .copyWith(
                                    color: AppColors.white100),
                              ),
                            ],
                          ),
                          trailing: _selectedGroupIndices.contains(index)
                              ? const Icon(
                            Icons.check_circle_outline_outlined,
                            color: AppColors.primary60,
                          )
                              : const Icon(
                            Icons.circle_outlined,
                            color: AppColors.white80,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
