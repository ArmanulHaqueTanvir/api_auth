//  String _startTime = DateFormat('kk:mm').format(DateTime.now());
// String _endTime = DateFormat('kk:mm').format(DateTime.now())

import 'package:api_auth/controller/registrtation_controller.dart';
import 'package:api_auth/pages/signin_page.dart';
import 'package:api_auth/utils/bigText.dart';
import 'package:api_auth/utils/colors.dart';
import 'package:api_auth/utils/dimention.dart';
import 'package:api_auth/utils/textField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    final RegistrationController registrationController =
        Get.put(RegistrationController());
    String? name, email, password;

    void _registrationFunction() {
      registrationController.registrationWithEmail(
          nameController.text, emailController.text, passController.text);
    }

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: Dimention.width20 - 5,
          right: Dimention.height10 + 5,
          bottom: Dimention.height10,
          top: Dimention.height45 * 2,
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   "assets/write.png",
                //   height: 100,
                //   width: 100,
                // ),
                Gap(Dimention.height10),
                bigText(
                  text: "Let's Sign Up here",
                  size: Dimention.font26,
                  color: AppColors.iconBgColor,
                ),
                Gap(Dimention.height10),
                Text(
                  "Find a best path of Technical \nEducation at here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Dimention.font10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(Dimention.height45),
                AppTextField(
                  title: "Full Name",
                  color: AppColors.iconBgColor,
                  controller: nameController,
                  hintText: "  Enter your Full name",
                  keyType: TextInputType.name,
                ),
                Gap(Dimention.height10),
                AppTextField(
                  title: "E-mail",
                  color: AppColors.iconBgColor,
                  controller: emailController,
                  hintText: "  Enter your mail",
                  keyType: TextInputType.emailAddress,
                ),
                Gap(Dimention.height10),
                AppTextField(
                  title: "Password",
                  color: AppColors.iconBgColor,
                  controller: passController,
                  hintText: "  ******",
                  keyType: TextInputType.visiblePassword,
                ),
                Gap(Dimention.height45 + 20),
                GestureDetector(
                  onTap: () {
                    _registrationFunction();
                  },
                  child: Container(
                    height: 50,
                    width: Dimention.screenWidth,
                    decoration: BoxDecoration(
                      color: AppColors.iconBgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: bigText(text: "Sign Up", color: Colors.white),
                    ),
                  ),
                ),
                Gap(Dimention.height20),
                RichText(
                  text: TextSpan(
                    text: "Have any account?",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: Dimention.font10,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(const LogInPage()),
                        text: ' Sign In.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.iconBgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
