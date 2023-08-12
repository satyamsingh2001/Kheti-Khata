import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/screens/bottom_nav_bar.dart';
import 'package:khetikhata/utils/Utils.dart';

import '../../../colors/colors_const.dart';
import '../../../styles/textstyle_const.dart';
import '../home/views/social/social.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>with TickerProviderStateMixin {

  TextEditingController _controller = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  TabController tabController = TabController(length: 2, vsync: this);
  return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                 Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: AppColors.white50,
                        child: Icon(Icons.person,size: 40,),
                      )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Satyam Singh",
                      style: AppTextStyles.kBody15SemiboldTextStyle
                          .copyWith(color: AppColors.white100),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Farmer",
                      style: AppTextStyles.kCaption12RegularTextStyle
                          .copyWith(color: AppColors.white60),
                    ),
                  ],
                ),
                Spacer(),
                TextButton(onPressed: (){
                  showBottomSheet(context: context, builder: (context){
                    return ConstantContainer(
                        height: MediaQuery.of(context).size.height/2,
                        child: EditProfile());
                  });
                }, child: Text("Edit",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.primary60,decoration: TextDecoration.underline),)),
              ],
            ),
            const Divider(color: AppColors.white60,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.location_on,color: AppColors.white50,),
                ),
                Text("Noida, Uttar Pradesh, India",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.calendar_today,color: AppColors.white50,),
                ),
                Text("Member since Aug 2023",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),),
              ],
            ),
            SizedBox(height: 10,),
            const Divider(color: AppColors.white60,),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: false,
              indicatorColor: AppColors.primary60,
              labelColor: AppColors.primary60,
              unselectedLabelColor: AppColors.white100,
              unselectedLabelStyle: AppTextStyles.kBody15SemiboldTextStyle,
              controller: tabController,
              tabs:  [
                Tab(
                  text: "My Posts".tr,
                ),
                Tab(
                  text: "Posts Contacted ".tr,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children:  [
                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification){
                      notification.disallowIndicator();
                      return true;
                    },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:5,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ConstPost(),
                    );
                  }),
                ),
                 Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget EditProfile(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Edit Profile",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
              Spacer(),
              Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(CupertinoIcons.multiply)),
              ) ,
            ],
          ),
          SizedBox(height: 20,),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.white50,
              child: Icon(Icons.person,size: 40,),
            ),
          ),
          SizedBox(height: 10,),
          Text("Name",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          SizedBox(
            height:45,
            child: TextFormField(
              controller: _controller..text="Satyam Singh",
              cursorColor: AppColors.primary60,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "Enter Full Name",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.white50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.primary60),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text("Location",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          SizedBox(
            height:45,
            child: TextFormField(
              controller: locationController..text="Noida",
              cursorColor: AppColors.primary60,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "Enter Location",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.white50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.primary60),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Utils.replacement(context, Bottom_Page(currentindex: 3));
              Utils.showToastMsg("Profile Updated Successfully");
            },
            child: ConstantContainer(
              color: AppColors.primary60,
              radiusBorder: 20,
              child: Center(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: Text("Update",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),),
              )),
            ),
          )


        ],
      ),
    );
  }
}
