import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/screens/bottom_nav_bar.dart';
import 'package:khetikhata/utils/Utils.dart';

import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';

class ChooseGroup extends StatefulWidget {
  const ChooseGroup({Key? key}) : super(key: key);

  @override
  State<ChooseGroup> createState() => _ChooseGroupState();
}

class _ChooseGroupState extends State<ChooseGroup> {
  bool _isClick = false;
  int _selectedOption = -1; // Initialize with no selection

  void _handleOptionSelected(int index) {
    setState(() {
      _selectedOption = index;
      _isClick = true;
    });
  }

  void _handleSubmit() {
    if (_isClick) {
      Utils.nevergoTo(context, Bottom_Page(currentindex: 0));
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification){
              notification.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                Text("Select Group",style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
                const SizedBox(height: 10,),
                Text("You are almost there, please select at least one group to onboard",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white70,wordSpacing: 2),),
                const SizedBox(height: 30,),
                ListView.builder(
                  shrinkWrap: true,
                    physics:  const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index) {
                      return index%2==0? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstantContainer(
                          borderColor: AppColors.white60,
                          radiusBorder: 10,
                          child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: (){
                              // Utils.goTo(context, const GeneralPost());
                            },
                            tileColor: AppColors.primary10,
                            leading: const CircleAvatar(
                              backgroundImage:
                              NetworkImage("https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw"),
                            ),
                            title: Text("message".tr,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
                            subtitle: Row(
                              children: [
                                Padding(
                                  padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: ConstantContainer(
                                    height: 20,
                                    width: 50,
                                    color: AppColors.white,
                                    radiusBorder: 10,
                                    child: Center(child: Text("Social",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),)),
                                  ),
                                ),
                                const Text("5 days ago",style: AppTextStyles.kSmall10RegularTextStyle,)
                              ],
                            ),
                            // trailing: ,
                          ),
                        ),
                      ):Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstantContainer(
                          borderColor: AppColors.white60,
                          radiusBorder: 10,
                          child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: (){

                            },
                            tileColor: AppColors.white30,
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage("https://imgs.search.brave.com/PfcJM9Qx2yB5UksFZ0p9peQjMlaRTZbqCPA50ntWTiM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvODYz/NDczNzk2L3Bob3Rv/L2EtOC1tb250aHMt/YmFieS1naXJsLXNt/aWxpbmcuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPW44NHhj/S0hKeE5Yc0lIdFcw/UHdJRTVyeFh3LTFM/RWdfUXp5VFVIcEFS/T3c9"),
                            ),
                            title: Text("message".tr,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
                            subtitle: Row(
                              children: [
                                Padding(
                                  padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: ConstantContainer(
                                    height: 20,
                                    // width: 50,
                                    color: AppColors.white,
                                    radiusBorder: 10,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text("Buy-Sell".tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.info40),),
                                    )),
                                  ),
                                ),
                                Text("193 Members",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white100),),

                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(height:20),
                GestureDetector(
                  onTap: _isClick ? _handleSubmit : null,
                  child: ConstantContainer(
                    height: size.height * .05,
                    width: size.width / 2,
                    radiusBorder: 20,
                    borderColor: AppColors.white100,
                    color: _isClick ? AppColors.primary60 : AppColors.white50,
                    child: Center(
                        child: Text(
                          "Next",
                          style: AppTextStyles.kBody15SemiboldTextStyle
                              .copyWith(color: AppColors.white),
                        )),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
