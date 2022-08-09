import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtu_app/app_data.dart';

import 'package:gtu_app/components/text_input.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/screens/drawer_screen.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/launch_url.dart';

class LogIn2Screen extends StatefulWidget {
  const LogIn2Screen({super.key});

  @override
  State<LogIn2Screen> createState() => _LogIn2ScreenState();
}

class _LogIn2ScreenState extends State<LogIn2Screen> {
  final FontStyle _fontStyle = FontStyle();

  final TextEditingController enrollmentNo = TextEditingController();

  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstName =
        TextEditingController(text: signinController.state.firstName);
    final TextEditingController lastName =
        TextEditingController(text: signinController.state.lastName);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.drawerBgColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(25, 60, 25, 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Howdy 👋", style: _fontStyle.manrope(40, FontWeight.w800)),
              Container(
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: signinController.obx(
                    (data) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextInput(
                              width: MediaQuery.of(context).size.width * 0.4,
                              maxLength: 20,
                              titleName: "First name",
                              hintText: "",
                              keyboardType: TextInputType.name,
                              textInputFormatter: RegExp("[a-zA-Z]"),
                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: firstName,
                            ),
                            TextInput(
                              width: MediaQuery.of(context).size.width * 0.4,
                              maxLength: 20,
                              titleName: "Last name",
                              hintText: "",
                              keyboardType: TextInputType.name,
                              textInputFormatter: RegExp("[a-zA-Z]"),
                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: lastName,
                            ),
                          ],
                        ),
                        TextInput(
                          width: MediaQuery.of(context).size.width * 1.0,
                          maxLength: 12,
                          titleName: "Enrollment No.",
                          hintText: "190420107000",
                          keyboardType: TextInputType.number,
                          textInputFormatter: RegExp("[0-9]"),
                          // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          controller: enrollmentNo,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'By clicking on Continue, you agree to the ',
                              style: _fontStyle
                                  .manrope(12, FontWeight.normal)
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            TextSpan(
                              text: 'Terms of Use',
                              style: _fontStyle
                                  .manrope(12, FontWeight.w500)
                                  .copyWith(color: AppColors.linkBlueColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    LaunchUrl().inAppWebView(url: termsOfUse),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: _fontStyle
                                  .manrope(12, FontWeight.normal)
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            TextSpan(
                              text: 'Privacy policy',
                              style: _fontStyle
                                  .manrope(12, FontWeight.w500)
                                  .copyWith(color: AppColors.linkBlueColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = LaunchUrl()
                                    .inAppWebView(url: privacyPolicy),
                            ),
                          ]),
                        ),
                        Container(
                          width: 170,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              onTap: () {
                                var en = enrollmentNo.text;
                                signinController.registerNewUser(
                                    firstName.text, lastName.text, en);
                                print("Continue button pressed" + en);
                              },
                              child: Center(
                                child: Text("Continue",
                                    style: _fontStyle
                                        .manrope(22, FontWeight.w600)
                                        .copyWith(color: AppColors.whiteColor)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Center(
                child: Text("Welcome to $appName",
                    style: _fontStyle.manrope(20, FontWeight.w700)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
