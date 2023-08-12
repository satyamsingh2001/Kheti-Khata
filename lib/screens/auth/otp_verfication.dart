import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../colors/colors_const.dart';
import '../../styles/textstyle_const.dart';
import '../../utils/Utils.dart';
import '../bottom_nav_bar.dart';
import 'login_screen.dart';

class OtpVerification extends StatefulWidget {
  final String text;
  const OtpVerification({super.key, required this.text});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  int _secondsRemaining = 60;
  Future<void> resendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.text,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        // Update the verification ID in the state
        LoginScreen.verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 30, color: AppColors.primary, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(203, 212, 225, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'OTP Verification',
                  style: AppTextStyles.kBody20SemiboldTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter OTP recieved on',
                  style: AppTextStyles.kCaption12RegularTextStyle
                      .copyWith(color: AppColors.neutralLight),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  widget.text,
                  style: AppTextStyles.kBody15SemiboldTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Pinput(
                    length: 6,
                    onChanged: (text) {
                      code = text;
                    },
                    defaultPinTheme: defaultPinTheme,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary60),
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: LoginScreen.verify,
                            smsCode: code);
                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
Utils.replacement(context, Bottom_Page(currentindex: 0,));
                      } catch (e) {
                        // print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Wrong otp'),
                          ),
                        );
                      }
                    }, child: Text("Verify"),),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      resendOTP();
                    },
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Didn’t you receive any code?',
                            style: AppTextStyles.kCaption12SemiboldTextStyle
                                .copyWith(color: AppColors.neutralLight, fontSize: 12),
                          ),
                          const WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              )),
                          TextSpan(
                              text: 'Resend Code',
                              style: AppTextStyles.kSmall10RegularTextStyle
                                  .copyWith(color: AppColors.primary, fontSize: 12)),
                          TextSpan(
                            text: ' ($_secondsRemaining Sec)',
                            style: AppTextStyles.kCaption12SemiboldTextStyle
                                .copyWith(color: AppColors.neutralLight, fontSize: 12),
                          )
                        ])),
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
