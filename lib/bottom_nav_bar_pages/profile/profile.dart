import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/bottom_nav_bar_pages/bottom_nav_bar.dart';
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
                 const Column(
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
                      "Farmer".tr,
                      style: AppTextStyles.kCaption12RegularTextStyle
                          .copyWith(color: AppColors.white60),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(onPressed: (){
                  showBottomSheet(
                      backgroundColor: AppColors.white20,
                      context: context, builder: (context){
                    return ConstantContainer(
                      color: AppColors.white20,
                        height: MediaQuery.of(context).size.height/2,
                        child: const EditProfile());
                  });
                }, child: Text("Edit".tr,style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.primary60,decoration: TextDecoration.underline),)),
              ],
            ),
            const Divider(color: AppColors.white60,),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.location_on,color: AppColors.white50,),
                ),
                Text("Noida, Uttar Pradesh, India",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.calendar_today,color: AppColors.white50,),
                ),
                Text("Member since Aug 2023",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),),
              ],
            ),
            const SizedBox(height: 10,),
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
                  text: "Post Contacted".tr,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
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
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ConstPost(),
                    );
                  }),
                ),
                 const Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
             } else {
        if (kDebugMode) {
          print('No image selected.'.tr);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Edit Profile".tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
              const Spacer(),
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
          const SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: _image == null
                        ?  CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black12,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Upload Profile'.tr,
                          style: const TextStyle(
                              color: AppColors.primary60, fontSize: 12),
                        ))
                        : ClipRRect(
                        child: Image.file(
                          _image!,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        getImage(ImageSource.camera);
                                      },
                                      leading: const Icon(
                                        Icons.add_a_photo,
                                        color: AppColors.primary60,
                                      ),
                                      title:  Text('Take Photo'.tr),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      leading: const Icon(
                                        Icons.photo_library,
                                        color: AppColors.primary60,
                                      ),
                                      title:
                                       Text('Select From Gallery'.tr),
                                    )
                                  ],
                                ));
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                                color: AppColors.primary60, width: 1.5)),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.primary60,
                          size: 20,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Text("Name".tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          SizedBox(
            height:45,
            child: TextFormField(
              controller: nameController..text="Satyam Singh",
              cursorColor: AppColors.primary60,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "Enter Full Name".tr,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.white50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.primary60),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text("Location".tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          SizedBox(
            height:45,
            child: TextFormField(
              controller: locationController..text="Noida",
              cursorColor: AppColors.primary60,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "Enter Location".tr,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.white50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.primary60),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Utils.replacement(context, BottomPage(currentIndex: 3));
              Utils.showToastMsg("Profile Updated Successfully".tr);
            },
            child: ConstantContainer(
              color: AppColors.primary60,
              radiusBorder: 20,
              child: Center(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: Text("Update".tr,style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),),
              )),
            ),
          )


        ],
      ),
    );
  }
}
