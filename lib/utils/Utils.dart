import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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

  static void openWhatsApp(String phoneNumber,message) async {
    final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  static void shareContent()  {
    try {
      String text = 'Check out this awesome app! Download it now.';
      String url = 'https://www.google.com';

      String formattedContent = '$text\n$url';

       Share.text('Share App', formattedContent,url);
    } catch (e) {
      print('Error sharing: $e');
    }
  }
  static DialogBox(BuildContext context ,String title,String content,Widget widget){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text('Cancel',style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        widget,
      ],
    ));
  }

  static PopUP(BuildContext context ,String title,){
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
    return Center(child:CircularProgressIndicator(
      backgroundColor: AppColors.primary,
      color: Colors.white,
    ));
  }

}