import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/textstyle_const.dart';

class Utils{

  //for circular indicator
  static bool isloading = false;

  static void  goTo(BuildContext context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }
  static void  replacement(BuildContext context, Widget nextScreen) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static   nevergoTo(BuildContext context, Widget nextScreen) {
    Get.offAll(nextScreen);
  }

  static Future<void> callNumber(String number) async{

    await FlutterPhoneDirectCaller.callNumber(number);
  }

  static void openWhatsApp(String phoneNumber, message) async {
    final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    try {
      if (await canLaunchUrl(url as Uri)) {
        await launchUrl(url as Uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error launching URL: $e');
      }
    }
  }

  static void shareContent()  {
    try {
      String text = 'Check out this awesome app! Download it now.';
      String url = 'https://www.google.com';

      String formattedContent = '$text\n$url';

       Share.text('Share App', formattedContent,url);
    } catch (e) {
      if (kDebugMode) {
        print('Error sharing: $e');
      }
    }
  }
  static constDialogBox(BuildContext context ,String title,Widget content,Widget widget){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(
          child: Text('Cancel'.tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        widget,
      ],
    ));
  }

  static popUP(BuildContext context ,String title,){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(title),
    ));
  }

  static void showToastMsg(String? msg, {bool isErrorType = false}) {
    Fluttertoast.showToast(
        msg: msg!,
        backgroundColor: isErrorType ? Colors.red : Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5);
  }

  Widget progressIndicator(BuildContext context){
    return const Center(child:CircularProgressIndicator(
      backgroundColor: AppColors.primary,
      color: Colors.white,
    ));
  }

  static dialogBoxConfirm(BuildContext context ,String title,String content,Widget widget){
    showDialog(context: context, builder: (context)=>AlertDialog(
      // title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text('Cancel'.tr,style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        widget,
      ],
    ));
  }

}