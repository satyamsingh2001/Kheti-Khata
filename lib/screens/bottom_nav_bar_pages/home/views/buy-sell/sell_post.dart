import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/const/const_dropdown.dart';
import 'package:khetikhata/styles/textstyle_const.dart';

import '../../widgets/addphoto_widgets.dart';


class SellPost extends StatefulWidget {
  const SellPost({Key? key}) : super(key: key);

  @override
  State<SellPost> createState() => _SellPostState();
}

class _SellPostState extends State<SellPost> {
  String isSelect = "Select Commodity";
  String isSelectPayment ="Select Payment Method";
  String unit1 = "Kg";
  String unit2 = "Kg";
  int value1 = 1; // Default selected index for the first set of CustomRadioButtons
  int value2 = 1; // Default selected index for the second set of CustomRadioButtons

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                      Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.multiply,
                        color: AppColors.white100,
                      ),
                    ),
                    Text(
                      "New Sell Post",
                      style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                    ),
                    ConstantContainer(
                      color: AppColors.primary60,
                      radiusBorder: 20,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                          child: Text(
                            "Publish",
                            style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.white50,
                            child: Icon(
                              CupertinoIcons.person,
                              color: AppColors.white10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Satyam Singh ',
                                style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white80),
                              ),
                              TextSpan(
                                text: '(Farmer)',
                                style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Posting on ',
                                style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),
                              ),
                              TextSpan(
                                text: 'Onion Trading ',
                                style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),
                              ),
                              TextSpan(
                                text: ' group',
                                style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const AddPhotoWidget(),
                const SizedBox(height: 5,),
                ConstantContainer(
                  borderColor: AppColors.white50,
                  radiusBorder: 3,
                  borderWidth: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ConstantDropdown(
                      options: const ["Select Commodity", "Onion", "Nasik Onion", "Rajasthan Onion", "MP Onion"],
                      selectedOption: isSelect,
                      onChanged: (value) {
                        setState(() {
                          isSelect = value;
                        });
                      },
                      iconColor: AppColors.white80,
                      dropdownColor: AppColors.white,
                      textColor: AppColors.white100,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                ConsTextField("", "","Noida Uttar Pradesh",1,TextInputType.phone),
                const SizedBox(height: 10,),
                ConsTextField("/ $unit1", "₹","Price / Unit",1,TextInputType.phone),
                Row(
                  children: [
                    CustomRadioButton("Kg", 1, 1),
                    CustomRadioButton("Quintal", 2, 1),
                    CustomRadioButton("Packet", 3, 1),
                  ],
                ),
                const SizedBox(height: 10,),
                ConsTextField("/ $unit2", "","Quantity",1,TextInputType.phone),
                Row(
                  children: [
                    CustomRadioButton("Kg", 1, 2),
                    CustomRadioButton("Quintal", 2, 2),
                    CustomRadioButton("Ton", 3, 2),
                  ],
                ),
                ConsTextField("", "","Description",5,TextInputType.text),
                const SizedBox(height: 10,),
                ConstantContainer(
                  borderColor: AppColors.white50,
                  radiusBorder: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ConstantDropdown(
                      options: const ["Select Payment Method", "Advance", "On Delivery", "Credit", ],
                      selectedOption: isSelectPayment,
                      onChanged: (value) {
                        setState(() {
                          isSelectPayment = value;
                        });
                      },
                      iconColor: AppColors.white80,
                      dropdownColor: AppColors.white,
                      textColor: AppColors.white100,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomRadioButton(String text, int index, int group) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (group == 1) {
              value1 = index;
              unit1 = text;
            } else if (group == 2) {
              value2 = index;
              unit2 = text;
            }
          });
        },
        child: ConstantContainer(
          radiusBorder: 20,
          color: (group == 1) ? (value1 == index) ? AppColors.primary60 : AppColors.white : (value2 == index) ? AppColors.primary60 : AppColors.white,
          borderColor: AppColors.white50,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
              child: Text(
                text,
                style: TextStyle(
                  color: (group == 1) ? (value1 == index) ? AppColors.white : AppColors.white100 : (value2 == index) ? AppColors.white : AppColors.white100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ConsTextField(suffix, prefix,hinttext,maxline,keytype) {
    return TextFormField(
      maxLines: maxline,
      cursorColor: AppColors.primary60,
      keyboardType: keytype,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white50,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white50,
          ),
        ),
        hintText: hinttext,
        suffixText: suffix,
        prefixText: prefix,
      ),
    );
  }
}
