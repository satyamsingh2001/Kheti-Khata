import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/screens/bottom_nav_bar_pages/home/views/buy-sell/buy-sell.dart';
import 'package:khetikhata/screens/bottom_nav_bar_pages/home/widgets/general_post.dart';
import 'package:khetikhata/screens/bottom_nav_bar_pages/home/views/social/social.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';
import '../widgets/const_create_post_widget.dart';

class HomeScreen extends StatefulWidget  {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context)  {
    int count =10;
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.white10,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary60,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.white10,
              useSafeArea: true,
              context: context, builder: (context){
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification){
                notification.disallowIndicator();
                return true;
              },
              child: ListView(

                children: [
                  ListTile(
                      title: Text("Choose a group".tr,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
                      subtitle: Text( "Where do you want to publish your post".tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white60),),
                      trailing:Material(
                        elevation: 5,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(CupertinoIcons.multiply)),
                      ) ,

                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: count,
                    itemBuilder: (context,index) {
                      return index%2==0? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstantContainer(
                          borderColor: AppColors.white40,
                          radiusBorder: 10,
                          child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: (){
                              Utils.goTo(context, const GeneralPost());
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
                          ),
                        ),
                      ):Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstantContainer(
                          borderColor: AppColors.white40,
                          radiusBorder: 10,
                          child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: (){
                              showModalBottomSheet(
                                backgroundColor: AppColors.white10,
                                  useSafeArea: true,
                                  context: context, builder: (context){
                                return const ConstCreatePostWidget();
                              });
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
                ],
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
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
                text: "Your Groups".tr,
              ),
              Tab(
               text: "News Feed".tr,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                YourGroup(),
                NewsFeed()
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class YourGroup extends StatelessWidget {
  const YourGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count =20;
    Size size = MediaQuery.of(context).size;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification){
        notification.disallowIndicator();
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: count,

          itemBuilder: (context,index){
        return index<count-1? Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstantContainer(
            radiusBorder: 10,
            borderColor: AppColors.white40,
            // color: AppColors.white,
            child: Column(
              children: [
                index%2==0? ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: (){
                    Utils.goTo(context, const Social());
                  },
                  tileColor: AppColors.primary10,
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage("https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw"),
                  ),
                  title: Text("message".tr,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
                  trailing: Column(
                    children: [
                      ConstantContainer(
                        height: 20,
                        width: 50,
                        color: AppColors.white,
                        radiusBorder: 10,
                        child: Center(child: Text("Social".tr,style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),)),
                      ),
                      const Spacer(flex: 1,),
                      const Text("5 days ago",style: AppTextStyles.kSmall10RegularTextStyle,)
                    ],
                  ),
                  subtitle: Text("Agriculture",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white100),),
                ):ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: (){
                    Utils.goTo(context, const BuySell());
                  },
                  tileColor: AppColors.white30,
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage("https://imgs.search.brave.com/PfcJM9Qx2yB5UksFZ0p9peQjMlaRTZbqCPA50ntWTiM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvODYz/NDczNzk2L3Bob3Rv/L2EtOC1tb250aHMt/YmFieS1naXJsLXNt/aWxpbmcuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPW44NHhj/S0hKeE5Yc0lIdFcw/UHdJRTVyeFh3LTFM/RWdfUXp5VFVIcEFS/T3c9"),
                  ),
                  title: Text("agriculture".tr,style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
                  trailing: Column(
                    children: [
                      ConstantContainer(
                        height: 20,
                        width: 50,
                        color: AppColors.white,
                        radiusBorder: 10,
                        child: Center(child: Text("Buy-Sell".tr,style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.info40),)),
                      ),
                      const Spacer(),
                      const Text("1 day ago",style: AppTextStyles.kSmall10RegularTextStyle,),

                    ],
                  ),
                  subtitle: Text("Agriculture",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white100),),
                ),
              ],
            ),
          ),
        ):Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstantContainer(
            radiusBorder: 10,
            borderColor: AppColors.white40,
            color: AppColors.white,
            child: Column(children: [  SizedBox(height: size.height*.05,),
              ConstantContainer(
                height: size.height*.13,
                width: size.width*.8,
                color: AppColors.white20,
                radiusBorder: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Invite buyers or seller on Agrishot and get engaged",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),),
                            const SizedBox(height: 10,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary60),
                                onPressed: (){
                                  Utils.shareContent();
                                }, child: const Text("Share App"))
                          ],
                        ),
                      ),
                      Image.network("https://imgs.search.brave.com/pUYH2yBeXifmr33_g6iiQcJhJo_Q6oPbLepP7Vw5V6g/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jbGlw/YXJ0LmluZm8vaW1h/Z2VzL21pbmljb3Zl/cnMvMTUwNTkxODY0/OWlwaG9uZS14LTEw/LXdpdGgtaGFuZC1w/bmcucG5n")
                    ],
                  ),
                ),
              ), SizedBox(height: size.height*.05,)],),
          ),
        );
      }),
    );
  }
}

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification){
        notification.disallowIndicator();
        return true;
      },
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstantContainer(
            color: AppColors.white,
            borderColor: AppColors.white40,
            radiusBorder: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5,),
                  Image.network(
                    "https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw",height: size.height*0.2,width: size.width,fit: BoxFit.fitWidth,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Material(
                            elevation: 5.0, // Adjust the elevation as needed
                            shape: const CircleBorder(
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(onPressed: (){
                              Utils.shareContent();
                            }, icon: const Icon(Icons.share)),
                          ),
                        ),
                        Material(
                          elevation: 5.0, // Adjust the elevation as needed
                          shape: const CircleBorder(
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: IconButton(onPressed: (){
                            Utils.shareContent();
                          }, icon: const Icon(CupertinoIcons.cart)),
                        ),

                      ],
                    ),
                  ),
                  Text("Global heating likely to hit world food supply before 1.5C, says UN expert",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
                 SizedBox(height: 5,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Agrishots ',
                          style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80,decoration: TextDecoration.underline,decorationColor: AppColors.primary60),
                        ),
                        TextSpan(
                          text: '  Aug 12, 06:01 AM',
                          style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Global heating, driven primarily by the accumulation of greenhouse gases in the atmosphere, is one of the most pressing challenges of our time. This phenomenon, commonly referred to as climate change, has far-reaching consequences, and one of the most critical areas it affects is the global food supply. As temperatures rise, extreme weather events become more frequent, and ecosystems shift, the stability of our agricultural systems is at risk. In this blog post, we'll explore how global heating is likely to impact the world food supply, the challenges it poses, and potential strategies to mitigate these effects.Global heating leads to more frequent and intense weather events such as heatwaves, droughts, and heavy rainfall. These unpredictable weather patterns can disrupt agricultural activities, impacting crop yields and leading to food shortages. Droughts, in particular, can have devastating effects on agriculture, especially in regions heavily dependent on rain-fed farming."
                  ,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white50),
                  ),
                  SizedBox(height: 5,),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(onPressed: (){}, child: Text("Read More ",style: TextStyle(color: AppColors.primary60),)))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
