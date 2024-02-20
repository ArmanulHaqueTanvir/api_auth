import 'package:api_auth/api/auth_api.dart';
import 'package:api_auth/controller/login_controller.dart';
import 'package:api_auth/pages/signUp_page.dart';
import 'package:api_auth/utils/bigText.dart';
import 'package:api_auth/utils/colors.dart';
import 'package:api_auth/utils/dimention.dart';
import 'package:api_auth/utils/textField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    // Immportant Variables here....
    AuthAPI _authAPI = AuthAPI();
    final _key = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final LoginController loginController = Get.put(LoginController());

    void _loginFunction() {
      loginController.loginWithEmail(emailController.text, passController.text);
    }
    // LoginController loginController = LoginController();
    // loginController.loginWithEmail();

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        // padding: EdgeInsets.only(
        //   left: Dimention.width20 - 5,
        //   right: Dimention.height10 + 5,
        //   bottom: Dimention.height10,
        //   top: Dimention.height45 + Dimention.height45,
        // ),

        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _key,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/write.png",
                  //   height: 100,
                  //   width: 100,
                  // ),
                  // Gap(Dimention.height10),
                  const Gap(10),
                  // bigText(
                  //   text: "Let's Sign you in",
                  //   size: Dimention.font26,
                  //   color: AppColors.iconBgColor,
                  // ),

                  const Text(
                    "Let's Sign you in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    "Find a best path of Technical \nEducation at here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(10),
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
                  const Gap(60),
                  GestureDetector(
                    onTap: () {
                      _loginFunction();
                    },
                    child: Container(
                      height: 50,
                      width: Dimention.screenWidth,
                      decoration: BoxDecoration(
                        color: AppColors.iconBgColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: bigText(text: "Sign In", color: Colors.white),
                      ),
                    ),
                  ),
                  const Gap(10),
                  RichText(
                    text: TextSpan(
                      text: "Don't have any account?",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 10,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(const SignUpPage()),
                          text: ' Register.',
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
      ),
    );
  }
}
