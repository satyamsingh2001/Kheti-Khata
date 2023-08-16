import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/screens/bottom_nav_bar.dart';
import '../../styles/textstyle_const.dart';
import 'otp_verfication.dart';

class LoginScreen extends StatefulWidget {
  static String verify = "";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  late String? phoneNumber;
  String ntoken = " ";


  @override
  void initState() {
    super.initState();
    getToken();
  }
  void getToken() async{
    await FirebaseMessaging.instance.getToken().then((token){
      setState(() {
        ntoken=token!;
        if (kDebugMode) {
          print("my token is $ntoken");
        }
      });

    } );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text("welcome".tr,style: AppTextStyles.kBody20SemiboldTextStyle,)),
            SizedBox(height: size.height*.1,),
            Text("Mobile Number",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100)),
            TextFormField(
              controller: _phoneNumberController,
              maxLength: 10,
              cursorColor: AppColors.primary60,
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary60)),
                  counterText: "",
                hintText: "Enter Mobile".tr
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: (_phoneNumberController.text.length==9)?AppColors.primary60:AppColors.white50,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              onPressed: (_phoneNumberController.text.length==10)?()async {
                final String phone = _phoneNumberController.text.trim();
                if (phone.isNotEmpty) {
                  phoneNumber = '+91$phone';
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumber!,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      LoginScreen.verify = verificationId;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerification(text: verificationId),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
              }:null,
              child:  Text("otp".tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Bottom_Page(currentindex: 0,)));
              },
              child: const Text("Skip"),
            ),
          ],
        ),
      ),
    );
  }
}

// class OtpVerification extends StatefulWidget {
//   final String verificationId;
//
//   const OtpVerification({required this.verificationId, Key? key}) : super(key: key);
//
//   @override
//   _OtpVerificationState createState() => _OtpVerificationState();
// }
//
// class _OtpVerificationState extends State<OtpVerification> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _otpController = TextEditingController();
//
//   String _validateOtp( value) {
//     if (value.isEmpty) {
//       return 'Please enter the OTP';
//     }
//     // Add additional validation logic here if needed
//     return "";
//   }
//
//   void _verifyOtp() async {
//     String otp = _otpController.text.trim();
//     if (otp.isNotEmpty) {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: otp,
//       );
//
//       try {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         // Authentication successful, you can navigate to the next screen or perform other actions
//         print('Authentication successful');
//       } catch (e) {
//         // Handle authentication failure
//         print('Authentication failed');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _otpController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'OTP',
//                   hintText: 'Enter the OTP received on your phone',
//                 ),
//                 validator: _validateOtp,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _verifyOtp,
//                 child: const Text('Verify OTP'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
