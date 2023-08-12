import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/styles/textstyle_const.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification){
            notification.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              Text("New updates",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ConstantContainer(
                      color: AppColors.white,
                      borderColor: AppColors.white60,
                      radiusBorder: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:   Image.network(
                                    "https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw",height:50,width: 50,),
                                )
                                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("bbgsjbgb adbfdsjdsfj defsakjfdskjhbsfdb bfdsjbfdsj",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white100),),
                                SizedBox(height: 10,),
                                Text("2 hr ago",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white60),),
                                ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
