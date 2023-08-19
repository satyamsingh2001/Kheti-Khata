import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/styles/textstyle_const.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary60,
        centerTitle: true,
        title: Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("At Kheti Khatas Pvt. Ltd. we recognize that privacy is very important. We promise to respect your contact preferences and to protect your private information. This Privacy Policy describes the information that is collected, how it is used and with whom it might be shared. This Privacy Policy applies to all of the services and products offered by Kheti Khatas Pvt. Ltd... Please read carefully the Privacy Policy and the Terms of Use before you use our website, our tools or our services and before conducting any type of transaction with us. By using any of our services, you accept the practices described in this Privacy Policy and you agree to be bound by the Terms of Use",
            style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white80,wordSpacing: 2),),
              SizedBox(height: 20,),
              Text("Data Collection",style: AppTextStyles.kBody20SemiboldTextStyle.copyWith(color: AppColors.white100),),
              SizedBox(height: 20,),
              Text("Our servers automatically record each visitor's domain name and IP address. We do not collect e-mail address unless the visitor registers to our service, communicates with us via e-mail or leaves a comment to our blog and forums. If you decide to register to our service, you are required to enter your email address, your username and your password. Entering your full name, company, job title, and other information is not mandatory during registration but you are obliged to complete your profile with all your valid information before using our services. We do not store your credit card information or other sensitive data on our servers. Kheti Khatas Pvt. Ltd. uses the services of the most secure payment gateway to provide safe and secure payment procedures. Your credit card information is never transmitted via our website since the payment gateway is responsible for collecting, storing and encrypting your data. All the information. that is collected is used for products and services provision, billing, identification and authentication, services improvement, contact and research. Kheti Khatas Pvt. Ltd. does not share your email address or other personally identifying information with any",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white80,wordSpacing: 2),),
            ],
          ),
        ),
      ),
    );
  }
}
