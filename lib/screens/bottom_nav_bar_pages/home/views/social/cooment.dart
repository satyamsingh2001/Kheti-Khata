import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../styles/textstyle_const.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification){
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:20),
                Row(
                  children: [
                    const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Text(
                      "Satyam Singh",
                      style: AppTextStyles.kBody15RegularTextStyle
                          .copyWith(
                          color: AppColors.white80,
                          wordSpacing: 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0),
                      child: Text(
                        "1 day ago",
                        style: AppTextStyles
                            .kCaption12RegularTextStyle
                            .copyWith(
                          color: AppColors.white60,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "hi tamatar kafi high rate pr h",
                    style: AppTextStyles.kBody15RegularTextStyle
                        .copyWith(
                        color: AppColors.white90,
                        wordSpacing: 3),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "1",
                      style: AppTextStyles
                          .kCaption12RegularTextStyle
                          .copyWith(color: AppColors.white70),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0),
                      child: const Icon(
                        CupertinoIcons.chat_bubble_fill,
                        color: AppColors.primary60,
                      ),
                    ),
                    Text(
                      "1",
                      style: AppTextStyles
                          .kCaption12RegularTextStyle
                          .copyWith(color: AppColors.white70),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: AppColors.white50,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust padding as needed
                  leading: CircleAvatar(
                    backgroundColor: AppColors.white50,
                    child: Icon(CupertinoIcons.person, color: AppColors.white),
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: AppColors.primary60,
                          decoration: InputDecoration(
                            hintText: "Write here".tr,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send, color: AppColors.white50),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
                ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading:  const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        title:   Row(
                          children: [
                            Text(
                              "Satyam Singh",
                              style: AppTextStyles.kBody15RegularTextStyle
                                  .copyWith(
                                  color: AppColors.white80,
                                  wordSpacing: 2),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              child: Text(
                                "1 day ago",
                                style: AppTextStyles
                                    .kCaption12RegularTextStyle
                                    .copyWith(
                                  color: AppColors.white60,
                                ),
                              ),
                            )
                          ],
                        ),
                        subtitle: Text("Farmer",style: AppTextStyles.kSmall10RegularTextStyle.copyWith(color: AppColors.white70)),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Koi bat nhi",
                          style: AppTextStyles.kBody15RegularTextStyle
                              .copyWith(
                              color: AppColors.white90,
                              wordSpacing: 3),
                        ),
                      ),
                    ],
                  );
                })




              ],
            ),
          ),
        ),
      ),
    );
  }
}
