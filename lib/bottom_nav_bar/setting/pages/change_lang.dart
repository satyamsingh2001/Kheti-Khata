import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';
import '../../bottom_nav_bar.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white10,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary60,
        title: const Text("Change Language"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text("Choose your Preferred Language",style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: (){
                  var locale = const Locale('en', '') ;
                  Get.updateLocale(locale);
                  Utils.nevergoTo(context, BottomPage(currentIndex: 0));
                },
                child: ConstantContainer(
                  height: MediaQuery.of(context).size.height*.05,
                  width: MediaQuery.of(context).size.width/1.5,
                  color: AppColors.white,
                  borderColor:  AppColors.primary60 ,
                  borderWidth: 2,// Adjust button color based on selection
                  radiusBorder: 20,
                 child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: Center(
                      child: Text(
                        'English',
                        style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: (){
                  var locale = const Locale('hi', '') ;
                  Get.updateLocale(locale);
                  Utils.nevergoTo(context, BottomPage(currentIndex: 0));
                },
                child: ConstantContainer(
                  height: MediaQuery.of(context).size.height*.05,
                  width: MediaQuery.of(context).size.width/1.5,
                  color: AppColors.white,
                  borderColor:  AppColors.primary60 ,
                  borderWidth: 2,// Adjust button color based on selection
                  radiusBorder: 20,
                 child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: Center(
                      child: Text(
                        'हिंदी',
                        style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
