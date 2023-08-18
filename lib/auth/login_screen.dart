import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/utils/Utils.dart';
import '../../styles/textstyle_const.dart';
import 'create_profile/name_page.dart';
import 'otp_verfication.dart';

class LoginScreen extends StatefulWidget {
  static String verify = "";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumberController = TextEditingController();

  late String? phoneNumber;
  String ntoken = " ";

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        ntoken = token!;
        if (kDebugMode) {
          print("my token is $ntoken");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "welcome".tr,
              style: AppTextStyles.kBody20SemiboldTextStyle,
            )),
            SizedBox(
              height: size.height * .1,
            ),
            Text("Mobile Number".tr,
                style: AppTextStyles.kBody15SemiboldTextStyle
                    .copyWith(color: AppColors.white100)),
            TextFormField(
              controller: _phoneNumberController,
              maxLength: 10,
              cursorColor: AppColors.primary60,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary60)),
                  counterText: "",
                  hintText: "Enter Mobile".tr),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: (_phoneNumberController.text.length == 10)
                      ? AppColors.primary60
                      : AppColors.white50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: (_phoneNumberController.text.length == 10)
                  ? () async {
                      final String phone = _phoneNumberController.text.trim();
                      if (phone.isNotEmpty) {
                        phoneNumber = '+91$phone';
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phoneNumber!,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            LoginScreen.verify = verificationId;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OtpVerification(text: verificationId),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            Utils.showToastMsg("Failed");
                          },
                        );
                      }
                    }
                  : null,
              child: Text("otp".tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const NamePage()));
              },
              child: const Text("Skip"),
            ),
          ],
        ),
      ),
    );
  }
}
