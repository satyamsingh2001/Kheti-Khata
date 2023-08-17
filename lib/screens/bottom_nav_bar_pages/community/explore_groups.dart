import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constString.dart';
import 'package:khetikhata/styles/textstyle_const.dart';

import '../../../const/constContainer.dart';
import '../../../utils/Utils.dart';

class ExploreGroups extends StatelessWidget {
  const ExploreGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explore Groups",style: AppTextStyles.kBody20RegularTextStyle.copyWith(color: AppColors.white100),),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification){
                  notification.disallowIndicator();
                  return true;
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    return index<4?Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ConstantContainer(
                        color: AppColors.white,
                        borderColor: AppColors.white40,
                        radiusBorder: 10,
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                      backgroundImage: AssetImage(whatsapp,)),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Millet Supply Chain",style: AppTextStyles.kBody17RegularTextStyle,),
                                ConstantContainer(
                                  height: 20,
                                  color: AppColors.primary10,
                                  radiusBorder: 10,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text("Buy-Sell".tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.info40),),
                                  )),
                                ),
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.groups,color: AppColors.white100,),
                                    ),
                                    Text("348 Members",style: AppTextStyles.kCaption12RegularTextStyle,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(Icons.show_chart,color: AppColors.white100,),
                                    ),
                                    Text("12 Posts",style: AppTextStyles.kCaption12RegularTextStyle,),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ConstantContainer(
                                color: AppColors.primary60,
                                radiusBorder: 30,
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                                  child: Text("Join".tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white),),
                                )),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ):Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38.0,vertical: 10),
                      child: ConstantContainer(
                        height: size.height*.15,
                        color: AppColors.white,
                        borderColor: AppColors.white40,
                        radiusBorder: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Request a group",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),),
                                    SizedBox(height: 5,),
                                    Text("Can't find what you are looking for ?\nRequest your own group!",style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white80,wordSpacing: 2),),
                                    const SizedBox(height: 10,),
                                    InkWell(
                                      onTap: (){
                                      showModalBottomSheet(context: context, builder: (context){
                                        return ConstantContainer(
                                          radiusBorder: 20,
                                          child: RequestAGroup(),
                                        );
                                      });
                                      },
                                      child: ConstantContainer(
                                        color: AppColors.primary60,
                                        radiusBorder: 30,
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                                          child: Text("Request".tr,style: AppTextStyles.kCaption12RegularTextStyle.copyWith(color: AppColors.white),),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.network("https://imgs.search.brave.com/pUYH2yBeXifmr33_g6iiQcJhJo_Q6oPbLepP7Vw5V6g/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jbGlw/YXJ0LmluZm8vaW1h/Z2VzL21pbmljb3Zl/cnMvMTUwNTkxODY0/OWlwaG9uZS14LTEw/LXdpdGgtaGFuZC1w/bmcucG5n")
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RequestAGroup extends StatefulWidget {
  const RequestAGroup({Key? key}) : super(key: key);

  @override
  State<RequestAGroup> createState() => _RequestAGroupState();
}

class _RequestAGroupState extends State<RequestAGroup> {
  int value =0;
  final TextEditingController _textEditingController = TextEditingController();
  bool _isButtonClickable = false;

  void _checkInputLength(String input) {
    setState(() {
      _isButtonClickable = input.length > 5;
    });
  }

  void _handleSubmit() {
    if (_isButtonClickable) {
    Navigator.pop(context);
      Utils.showToastMsg("Request send successfully");

      print('Text is longer than 5 characters. Submitting...');
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Request a group",style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
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
          SizedBox(height: 10,),
          Text("Request a new group of your interests. We will approve group ideas with high interest and add them ontoExplore page.",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white70),),
          SizedBox(height: 10,),
          Text("Name of Group",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white100),),
           Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height*0.05,
            child: TextFormField(
              controller: _textEditingController,
              onChanged: _checkInputLength,
              cursorColor: AppColors.primary60,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                hintText: "Enter Full Name".tr,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.white50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.primary60),
                ),
              ),
            ),
          ),
        ),
          SizedBox(height: 10,),
          Text("Choose the type of the group of your topic",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: AppColors.white50),),

       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           children: [
           CustomRadioButton("Buy-Sell",1),
           CustomRadioButton("Social",2),
         ],),
       ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: InkWell(
                onTap:_isButtonClickable ? _handleSubmit : null,
                child: ConstantContainer(
                  height: size.height*.05,
                  width: size.width/2,
                  color: _isButtonClickable?AppColors.primary60:AppColors.white50,
                  radiusBorder: 40,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Request",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget CustomRadioButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: ConstantContainer(
          radiusBorder: 20,
          color: (value == index) ? AppColors.primary60 : AppColors.white ,
          borderColor: AppColors.white50,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
              child: Text(
                text,
                style: TextStyle(
                  color: (value== index) ? AppColors.white : AppColors.white100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
