import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtu_app/app_data.dart';

import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("Howdy 👋", style: FontStyle.manrope(40, FontWeight.w800)),
              // Center(
              //   child: Image.asset(rocketImg, height: 250),
              // ),
              Center(
                child: Lottie.asset(AppAnimation.rocketAnimation, height: 250),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LogIn", style: FontStyle.manrope(30, FontWeight.w700)),
                  const SizedBox(
                    height: 25,
                  ),
                  logInButton(),
                ],
              ),
              Center(
                child: Text("Welcome to $appName",
                    style: FontStyle.manrope(20, FontWeight.w700)),
              )
            ],
          ),
        ),
      ),
    );
  }

  logInButton() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: AppColors.blackColor,
          width: 4,
        ),
      ),
      child: signinController.obx(
        (state) => Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onTap: () => {signinController.loginWithGoogle()},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImage.googleLogoImg,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("Continue with Google",
                    style: FontStyle.manrope(18, FontWeight.w600))
              ],
            ),
          ),
        ),
        onLoading: Center(
          child: Container(
            height: 70,
            child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [AppColors.primaryColor],
            ),
          ),
        ),
        onError: (error) => Container(),
      ),
    );
  }
}
