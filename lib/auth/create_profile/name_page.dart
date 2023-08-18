import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../../../styles/textstyle_const.dart';
import 'about_occ.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonClickable = false;

  void _checkInputLength(String input) {
    setState(() {
      _isButtonClickable = input.length > 5;
    });
  }

  void _handleSubmit() {
    if (_isButtonClickable) {
      Utils.goTo(context, const AboutOcc());

    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: size.height/4,),
              Text("What should we call you?".tr,style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
              const SizedBox(height: 25,),
               SizedBox(
            height: size.height*0.05,
            child: TextFormField(
              controller: _nameController,
              onChanged: _checkInputLength,
              cursorColor: AppColors.primary60,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: "Enter Full Name".tr,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.white50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.primary60),
                ),
              ),
            ),),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: _isButtonClickable?_handleSubmit:null,
                child: ConstantContainer(
                  height: size.height*.05,
                  width: size.width/2,
                  radiusBorder: 20,
                  borderColor: AppColors.white100,
                  color: _isButtonClickable?AppColors.primary60:AppColors.white50,
                  child: Center(child: Text("next".tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),)),
                ),
              )

            ]
          ),
        ),
      ),
    );
  }
}
