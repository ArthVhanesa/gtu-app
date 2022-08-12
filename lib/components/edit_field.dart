// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/text_input.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class ShowEditDialog {
  static nameEditDialog({required context}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => EditDialog(isNameEditDialog: true),
    );
  }

  static enrollmentEditDialog({required context}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => EditDialog(isNameEditDialog: false),
    );
  }
}

class EditDialog extends StatelessWidget {
  bool isNameEditDialog;

  EditDialog({
    Key? key,
    required this.isNameEditDialog,
  }) : super(key: key);

  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstName = TextEditingController(
        text: signinController.dbUserData.value.firstName);
    final TextEditingController lastName =
        TextEditingController(text: signinController.dbUserData.value.lastName);
    final TextEditingController enrollmentNo = TextEditingController(
        text: signinController.dbUserData.value.enrollmentNo);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top:
                  90, // Top padding = -(Top position of positioned widget of image)
              right: 20,
              bottom: 10,
            ),
            child: Container(
              width: double.infinity,
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  isNameEditDialog
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextInput(
                              width: MediaQuery.of(context).size.width * 0.32,
                              maxLength: 20,
                              titleName: "First name",
                              hintText: "",
                              keyboardType: TextInputType.name,
                              textInputFormatter: RegExp("[a-zA-Z]"),
                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: firstName,
                            ),
                            TextInput(
                              width: MediaQuery.of(context).size.width * 0.32,
                              maxLength: 20,
                              titleName: "Last name",
                              hintText: "",
                              keyboardType: TextInputType.name,
                              textInputFormatter: RegExp("[a-zA-Z]"),
                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: lastName,
                            ),
                          ],
                        )
                      : TextInput(
                          width: MediaQuery.of(context).size.width * 1.0,
                          maxLength: 12,
                          titleName: "Enrollment No.",
                          hintText: "190420107000",
                          keyboardType: TextInputType.number,
                          textInputFormatter: RegExp("[0-9]"),
                          // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          controller: enrollmentNo,
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 3,
                            ),
                            child: Text(
                              'Done',
                              style: FontStyle.manrope(18, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top:
                -90, // Top position of positioned widget of image = -(Top padding of child of Stacky)
            child: Image.asset(
              AppImage.pencilImg,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}