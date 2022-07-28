import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtu_app/controllers/signInController.dart';
import 'package:gtu_app/provider/provider.dart';
import 'package:gtu_app/style.dart';
import 'package:gtu_app/image.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.whiteColor,
      body: SafeArea(
        child: Container(
          color: _colors.whiteColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(25, 60, 25, 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Howdy 👋", style: _fontStyle.manrope(40, FontWeight.w800)),
              Center(
                child: Image.asset(rocketImg, height: 250),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LogIn", style: _fontStyle.manrope(30, FontWeight.w700)),
                  const SizedBox(
                    height: 25,
                  ),
                  logInButton(),
                ],
              ),
              Center(
                child: Text("Welcome to MyGTU",
                    style: _fontStyle.manrope(20, FontWeight.w700)),
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
      decoration: BoxDecoration(
        color: _colors.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: _colors.blackColor,
          width: 4,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          onTap: () => {signinController.loginWithGoogle()},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                googleLogoImg,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Continue with Google",
                  style: _fontStyle.manrope(18, FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
