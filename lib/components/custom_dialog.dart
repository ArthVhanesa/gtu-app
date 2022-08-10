import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class CustomDialog extends StatelessWidget {
  String title;
  String message;
  String image;
  String buttonName;
  CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.image,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    title,
                    style: FontStyle.manrope(18, FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    style: FontStyle.manrope(16, FontWeight.bold)
                        .copyWith(color: AppColors.titleColor),
                    textAlign: TextAlign.center,
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 3,
                            ),
                            child: Text(
                              buttonName,
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
              image,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowCustomDialog {
  static initial(
      {required context,
      required String title,
      required String message,
      String image = AppImage.circularImg,
      String buttonName = 'Ok'}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CustomDialog(
        title: title,
        message: message,
        image: image, // default name
        buttonName: buttonName, // defalut name
      ),
    );
  }

  static customized(
      {required context,
      required String title,
      required String message,
      required String image,
      required String buttonName}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CustomDialog(
        title: title,
        message: message,
        image: image,
        buttonName: buttonName,
      ),
    );
  }
}
