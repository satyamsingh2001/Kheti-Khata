import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';
import 'package:khetikhata/styles/textstyle_const.dart';
import '../../../../../utils/Utils.dart';
import 'cooment.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white10,
      body: SafeArea(
        child:NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification){
            notification.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              ListTile(
                leading: const CircleAvatar(),
                title: Center(
                    child: Text(
                  "agriculture".tr,
                  style: AppTextStyles.kBody15SemiboldTextStyle
                      .copyWith(color: AppColors.white100),
                )),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ConstantContainer(
                        color: AppColors.primary20,
                        radiusBorder: 50,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                          child: Text(
                            "Social".tr,
                            style: AppTextStyles.kCaption12RegularTextStyle,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "126${"Members".tr}",
                      style: AppTextStyles.kCaption12RegularTextStyle
                          .copyWith(color: AppColors.white50),
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.primary60,
                thickness: 2,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ConstPost()
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ConstPost extends StatefulWidget {
  const ConstPost({Key? key}) : super(key: key);
  @override
  State<ConstPost> createState() => _ConstPostState();
}

class _ConstPostState extends State<ConstPost> {
  bool likes = false;
  void likeSwitch() {
    setState(() {
      likes = !likes;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstantContainer(
      color: AppColors.white,
      borderColor: AppColors.white60,
      radiusBorder: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    "1" + "day ago".tr,
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
                  child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
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
                  child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.chat_bubble_fill,
                        color: AppColors.primary60,
                      )),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        likeSwitch();
                      },
                      child: CircleAvatar(
                        radius: 20.3,
                        backgroundColor: AppColors.white50,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: likes
                                ? AppColors.secondary2
                                : AppColors.white,
                            child: Icon(
                                likes
                                    ? Icons.favorite
                                    : Icons
                                    .favorite_border_outlined,
                                color: likes
                                    ? AppColors.white
                                    : AppColors.white60)
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Utils.shareContent();
                      },
                      child: const CircleAvatar(
                        radius: 20.3,
                        backgroundColor: AppColors.white50,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.share,
                              color: AppColors.white60,
                            )),
                      )),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Utils.goTo(context, const CommentPage());
                      },
                      child: const CircleAvatar(
                        radius: 20.3,
                        backgroundColor: AppColors.white50,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              CupertinoIcons.chat_bubble,
                              color: AppColors.white60,
                            )),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
