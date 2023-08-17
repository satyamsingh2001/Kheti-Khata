import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/const/constString.dart';

import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white10,
      appBar: AppBar(
        backgroundColor: AppColors.primary60,
        centerTitle: true,
        title: Text("Bookmarks"),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification){
          notification.disallowIndicator();
          return true;
        },
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstantContainer(
              color: AppColors.white,
              borderColor: AppColors.white60,
              radiusBorder: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Invite buyers or seller on Kheti Khata and get engaged".tr,style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Material(
                                    elevation: 5.0, // Adjust the elevation as needed
                                    shape: const CircleBorder(
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: IconButton(onPressed: (){
                                      // Utils.shareContent();
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
                                  }, icon: Image.asset(save)),
                                ),

                              ],
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
        }),
      ),
    );
  }
}
