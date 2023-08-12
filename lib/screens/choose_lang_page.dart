import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/const/const_dropdown.dart';
import 'package:khetikhata/screens/auth/login_screen.dart';
import 'package:khetikhata/styles/textstyle_const.dart';
import 'package:khetikhata/utils/Utils.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    String selectedValue = 'English';
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: size.height*.4,),
              const Text("Select Language",style: AppTextStyles.kBody15SemiboldTextStyle,),
              SizedBox(height: size.height*.01,),
              ConstantContainer(
                radiusBorder: 30,
                width: size.width*.5,
                borderColor: AppColors.white100,
                borderWidth: 1,
                child: ConstantDropdown(
                  options: const [ "English", "हिंदी"],
                  selectedOption: selectedValue,
                  onChanged: (value) {
                    selectedValue = value;
                  },
                  iconColor: AppColors.white100,
                  dropdownColor: AppColors.white,
                  textColor: AppColors.white100,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    var locale = selectedValue == 'English' ? Locale('en', '') : Locale('hi', '');
                    Get.updateLocale(locale);
                    Utils.replacement(context, LoginScreen());
                  }
                },
                child: ConstantContainer(
                  color: AppColors.primary60,
                  radiusBorder: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                    child: Text('Next',style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
