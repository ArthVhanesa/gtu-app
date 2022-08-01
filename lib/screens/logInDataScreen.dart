import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtu_app/components/TextInput.dart';
import 'package:gtu_app/controllers/signInController.dart';
import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/screens/drawerScreen.dart';
import 'package:gtu_app/style/style.dart';

class LogIn2Screen extends StatefulWidget {
  const LogIn2Screen({super.key});

  @override
  State<LogIn2Screen> createState() => _LogIn2ScreenState();
}

class _LogIn2ScreenState extends State<LogIn2Screen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final signinController = Get.put(SignInController());

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _enrollmentNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                              hintText: data.firstName ?? "",
                              keyboardType: TextInputType.name,
                              textInputFormatter: RegExp("[a-zA-Z]"),
                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: _firstName,
                            ),
                            TextInput(
                              width: MediaQuery.of(context).size.width * 0.4,
                              maxLength: 20,
                              titleName: "Last name",
                              hintText: data.lastName ?? "",
                              keyboardType: TextInputType.name,
                              textInputFormatter: RegExp("[a-zA-Z]"),
                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: _lastName,
                            ),
                          ],
                        ),
                        TextInput(
                          width: MediaQuery.of(context).size.width * 1.0,
                          maxLength: 12,
                          titleName: "Enrollment No.",
                          hintText: "123456789123",
                          keyboardType: TextInputType.number,
                          textInputFormatter: RegExp("[0-9]"),
                          // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          controller: _enrollmentNo,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          width: 170,
                          height: 60,
                          decoration: BoxDecoration(
                            color: _colors.blackColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              onTap: () {
                                var en = _enrollmentNo.text;
                                print("Continue button pressed" + en);
                                Get.to(() => ZoomDrawerScreen());
                              },
                              child: Center(
                                child: Text("Continue",
                                    style: _fontStyle
                                        .manrope(22, FontWeight.w600)
                                        .copyWith(color: _colors.whiteColor)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
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
}
