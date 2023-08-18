import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/const/constString.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../const/constContainer.dart';
import '../../../../../styles/textstyle_const.dart';
import '../../widgets/const_create_post_widget.dart';
import '../social/social.dart';
import 'const_pageview.dart';

class BuySell extends StatefulWidget {
  const BuySell({Key? key}) : super(key: key);

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> with TickerProviderStateMixin{
  @override


  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white10,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary60,
        onPressed: () {
          showModalBottomSheet(
              useSafeArea: true,
              context: context, builder: (context){
            return const ConstCreatePostWidget();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(),
              title: Center(
                  child: Text(
                    "agriculture".tr,
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white100),
                  )),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ConstantContainer(
                      color: AppColors.primary20,
                      radiusBorder: 50,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                        child: Text(
                          "Buy-Sell".tr,
                          style: AppTextStyles.kCaption12RegularTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "119 Members",
                    style: AppTextStyles.kCaption12RegularTextStyle
                        .copyWith(color: AppColors.white50),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: AppColors.primary60,
                thickness: 1,
              ),
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: AppColors.white100,
              unselectedLabelStyle: AppTextStyles.kBody15SemiboldTextStyle,
              indicator: BoxDecoration(
                  color: AppColors.primary60,
                  borderRadius: BorderRadius.circular(40)),
              indicatorColor: Colors.black,
              controller: tabController,
              tabs:  [
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary60,
                  radiusBorder: 20,
                  child: const Center(
                    child: Tab(
                      child: Text(
                        "Seller posts",
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary60,
                  radiusBorder: 20,
                  child: const Center(
                    child: Tab(
                      child: Text(
                        "Buyers posts",
                      ),
                    ),
                  ),
                ),
                ConstantContainer(
                  height: size.height * .03,
                  borderWidth: 1,
                  borderColor: AppColors.primary60,
                  radiusBorder: 20,
                  child: const Center(
                    child: Tab(
                      child: Text(
                        "All",
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Expanded(
              // height: size.height,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  SellersPost(),
                  BuyersPost(),
                  BuyersPost(),
                  // YourGroup()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BuyersPost extends StatelessWidget {
  const BuyersPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification){
        notification.disallowIndicator();
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstantContainer(
              borderWidth: 1,
              radiusBorder: 20,
              color: AppColors.white,
              borderColor: AppColors.white40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Nasik Onion,",style: AppTextStyles.kBody15SemiboldTextStyle,),
                        Text("22 Qt,",style: AppTextStyles.kBody15SemiboldTextStyle,),
                        Text("Rs22-RS11/Qt,",style: AppTextStyles.kBody15SemiboldTextStyle,),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.location_solid,color: AppColors.primary60,),
                         Text("Sector 62 Noida, ",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.primary60),),
                        const Text("36 day ago",style: AppTextStyles.kCaption12RegularTextStyle,),
                        const Spacer(),
                         Material(
                          elevation: 5.0, // Adjust the elevation as needed
                          shape: const CircleBorder(
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: IconButton(onPressed: (){
                            Utils.shareContent();
                          }, icon: const Icon(Icons.share)),
                        )
                      ],
                    ),
                    const Divider(color: AppColors.white40,thickness: 1,),
                    Text("Payment Condition".tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.warning100),),
                    const SizedBox(height: 10,),
                     ConstantContainer(
                      width: 70,
                      color: AppColors.primary60,
                      borderWidth: 1.5,
                      radiusBorder: 20,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                          child: Text("Cash",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text("want to buy onions",style: AppTextStyles.kBody15RegularTextStyle,),
                    const Divider(color: AppColors.white40,thickness: 1,),
                    ListTile(
                      leading: const CircleAvatar(),
                      title: Row(
                        children: [
                          const Text("Satyam",style: AppTextStyles.kBody15RegularTextStyle,),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                                onTap: (){
                                  Utils.openWhatsApp("6393604028", "Hello");
                                },
                                child: Image.asset(whatsapp,height: 30,width: 30,)),
                          ),
                          InkWell(
                            onTap: (){
                              Utils.callNumber("123");
                            },
                            child: ConstantContainer(
                              color: Colors.deepOrange,
                              radiusBorder: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
                                child: Row(
                                  children: [
                                    const Icon(Icons.call,color: AppColors.white,),
                                    Text("Call Buyer",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Text("Mandi Trader",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white70),),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

class SellersPost extends StatelessWidget {
  const SellersPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification){
        notification.disallowIndicator();
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstantContainer(
              borderWidth: 1,
              radiusBorder: 20,
              color: AppColors.white,
              borderColor: AppColors.white40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Nasik Onion,",style: AppTextStyles.kBody15SemiboldTextStyle,),
                        Text("22 Qt,",style: AppTextStyles.kBody15SemiboldTextStyle,),
                        Text("Rs22-RS11/Qt,",style: AppTextStyles.kBody15SemiboldTextStyle,),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.location_solid,color: AppColors.primary60,),
                         Text("Sector 62 Noida, ",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.primary60),),
                        const Text("36 day ago",style: AppTextStyles.kCaption12RegularTextStyle,),
                        const Spacer(),
                         Material(
                          elevation: 5.0, // Adjust the elevation as needed
                          shape: const CircleBorder(
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: IconButton(onPressed: (){
                            Utils.shareContent();
                          }, icon: const Icon(Icons.share)),
                        )
                      ],
                    ),
                    SizedBox(
                        height: size.height * 0.2,
                        child: ConstPageview(pageCount: 5,)),
                    Text("Payment Condition".tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.warning100),),
                    const SizedBox(height: 10,),
                     ConstantContainer(
                      width: 70,
                      color: AppColors.primary60,
                      borderWidth: 1.5,
                      radiusBorder: 20,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                          child: Text("Cash",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text("want to buy onions",style: AppTextStyles.kBody15RegularTextStyle,),
                    const Divider(color: AppColors.white40,thickness: 1,),
                    ListTile(
                      leading: const CircleAvatar(),
                      title: Row(
                        children: [
                          const Text("Satyam",style: AppTextStyles.kBody15RegularTextStyle,),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                                onTap: (){
                                  Utils.openWhatsApp("+916393604028", "Hello");
                                },
                                child: Image.asset(whatsapp,height: 30,width: 30,)),
                          ),
                          InkWell(
                            onTap: (){
                              Utils.callNumber("123");
                            },
                            child: ConstantContainer(
                              color: Colors.deepOrange,
                              radiusBorder: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
                                child: Row(
                                  children: [
                                    const Icon(Icons.call,color: AppColors.white,),
                                    Text("Call Seller",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Text("Mandi Trader",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white70),),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List name = [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: ConstPost(),
      ),
      const SellersPost(),
      const BuyersPost(),
    ];
    return  NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification){
        notification.disallowIndicator();
        return true;
      },
      child: ListView.builder(
          itemCount: 7,
          // shrinkWrap: true,
          // physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return name[index];
          }),
    );
  }
}

