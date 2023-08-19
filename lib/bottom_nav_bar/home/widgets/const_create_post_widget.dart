import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../colors/colors_const.dart';
import '../../../../const/constContainer.dart';
import '../../../../styles/textstyle_const.dart';
import '../../../../utils/Utils.dart';
import '../views/buy-sell/buy_post.dart';
import '../views/buy-sell/sell_post.dart';
import 'general_post.dart';

class ConstCreatePostWidget extends StatelessWidget {
  const ConstCreatePostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> title =[
      "Sell Post",
      "Buy Post",
      "General Post",
    ];
    List<String> subtitle =[
      "I want to sell agri produce.",
      "I want to buy agri produce.",
      "I want to share my thoughts.",

    ];
    List onTap =[
      const SellPost(),
      const BuyPost(),
      const GeneralPost(),

    ];

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification){
        notification.disallowIndicator();
        return true;
      },
      child: Column(
        children: [
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text("Create a Post".tr,style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
            subtitle: Text( "What do you want to post?".tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white60),),
            trailing:Material(
              elevation: 5,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(CupertinoIcons.multiply)),
            ),
          ),
          const Divider(color: AppColors.white40,thickness: 1,),
          ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Utils.replacement(context, onTap[index]);
                    },
                    child: ConstantContainer(
                      color: AppColors.white,
                      radiusBorder: 20,
                      borderColor: AppColors.white70,
                      child: ListTile(
                        title: Text(title[index].tr,style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
                        subtitle: Text(subtitle[index].tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white50),),


                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
