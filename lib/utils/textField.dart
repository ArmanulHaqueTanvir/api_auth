import 'package:api_auth/utils/bigText.dart';
import 'package:api_auth/utils/colors.dart';
import 'package:api_auth/utils/dimention.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText, title;
  final TextEditingController controller;
  final TextInputType keyType;
  final Color color;
  bool? obsecureText;
  AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyType,
    required this.title,
    required this.color,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        bottom: 10,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bigText(
            text: title,
            color: color,
            size: Dimention.font20 - 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimention.radius20 + 10),
            ),
            child: TextField(
              // obscuringCharacter: "h",s
              obscureText: obsecureText!,

              keyboardType: keyType,
              controller: controller,
              decoration: InputDecoration(
                // prefix: Gap(1),
                // helperText: "armna123@gmail.com",
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimention.radius10),
                  borderSide: BorderSide(
                    color: AppColors.iconBgColor,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimention.radius10),
                  // borderSide: const BorderSide(
                  //   width: 5,
                  //   color: Colors.red,
                  // ),
                ),

                disabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimention.radius10),
                  borderSide: BorderSide(
                    color: AppColors.iconBgColor,
                    width: 1,
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: Dimention.height15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
