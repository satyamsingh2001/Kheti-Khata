import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/screens/auth/login_screen.dart';
import 'package:khetikhata/styles/textstyle_const.dart';
import 'package:khetikhata/utils/Utils.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({Key? key}) : super(key: key);

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  int value =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height*.4,),
            const Text("Select Your Preferred Language",style: AppTextStyles.kBody15SemiboldTextStyle,),
            SizedBox(height: size.height*.01,),
            customRadioButton("English",1,context),
            customRadioButton("हिंदी",2,context),
            const SizedBox(height: 26),
            GestureDetector(
              onTap: () {
                if (value != 0) { // Check if a language is selected
                  var locale = value == 1 ? const Locale('en', '') : const Locale('hi', '');
                  Get.updateLocale(locale);
                  Utils.replacement(context, const LoginScreen());
                }
              },
              child: ConstantContainer(
                color: value != 0 ? AppColors.primary60 : AppColors.white50, // Adjust button color based on selection
                radiusBorder: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: Text(
                    'Next',
                    style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customRadioButton(String text, int index,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: ConstantContainer(
          height: MediaQuery.of(context).size.height*.05,
          width: MediaQuery.of(context).size.width/1.5,
          radiusBorder: 20,
          color: (value == index) ? AppColors.primary60 : AppColors.white ,
          borderColor: AppColors.white50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: (value== index) ? AppColors.white : AppColors.white100,fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
