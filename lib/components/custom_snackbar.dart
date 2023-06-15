import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class SnackBarType {
  Color color;
  String image;
  SnackBarType({
    required this.color,
    required this.image,
  });

  static SnackBarType error =
      SnackBarType(color: AppColors.errorColor, image: AppImage.errorImg);
  static SnackBarType warning =
      SnackBarType(color: AppColors.warningColor, image: AppImage.warningImg);
  static SnackBarType success =
      SnackBarType(color: AppColors.sucessColor, image: AppImage.sucessImg);
  static SnackBarType noInternet = SnackBarType(
      color: AppColors.warningColor, image: AppImage.noInternetImg);
}

// Custome snackbar without get
class CustomSnackBarWithoutGet extends StatelessWidget {
  String title;
  String message;
  SnackBarType snackBarType;

  CustomSnackBarWithoutGet({
    Key? key,
    this.title = "",
    this.message = "",
    required this.snackBarType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
      height: 90,
      decoration: BoxDecoration(
          color: snackBarType.color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: snackBarType.color.withOpacity(0.9),
              blurRadius: 7,
              offset: Offset(0, 4),
            )
          ]),
      child: Row(
        children: [
          Image.asset(
            snackBarType.image,
            height: 90,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontStyle.manrope(18, FontWeight.w600)
                      .copyWith(color: AppColors.blackColor),
                ),
                Text(
                  message,
                  style: FontStyle.manrope(12, FontWeight.w500)
                      .copyWith(color: AppColors.blackColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// show Custome snackbar without get
class ShowCustomSnackBarWithoutGet {
  // @usage:  ShowCustomSnackBar.warn(context,"title..","message...");
  //for warning
  static warn({String title = "Oops!!", String message = ""}) {
    //remove old snackbars before showing new one.
    Get.closeCurrentSnackbar();

    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBarWithoutGet(
          title: title, message: message, snackBarType: SnackBarType.warning),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  // @usage:  ShowWiCustomSnackBarWithoutGet.error(context,"title..","message...");
  //for Error
  static error(
      {String title = "Error!!", String message = "Something went wrong!"}) {
    Get.closeCurrentSnackbar();

    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBarWithoutGet(
          title: title, message: message, snackBarType: SnackBarType.error),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  static success({String title = "Hurray!", String message = "Successfull!"}) {
    Get.closeCurrentSnackbar();

    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBarWithoutGet(
          title: title, message: message, snackBarType: SnackBarType.success),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  static noInternet() {
    Get.closeCurrentSnackbar();

    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBarWithoutGet(
          title: "Oops!",
          message: "You are offline!",
          snackBarType: SnackBarType.noInternet),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(days: 1),
    ));
  }
}

class ShowCustomSnackBar {
  // @usage:  ShowCustomSnackBar.warn(context,"title..","message...");
  //for warning
  static warn({String title = "Oops!!", String message = ""}) {
    //remove old snackbars before showing new one.
    Get.closeCurrentSnackbar();

    Get.snackbar(
      titleText: Text(
        title,
        style: FontStyle.manrope(18, FontWeight.w600)
            .copyWith(color: AppColors.blackColor),
      ),
      messageText: Text(
        message,
        style: FontStyle.manrope(15, FontWeight.w400)
            .copyWith(color: AppColors.titleColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      title,
      message,
      icon: const Icon(
        Icons.warning_outlined,
        color: Colors.black,
        size: 35,
      ),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 10,
      overlayColor: AppColors.warningColor,
      backgroundColor: AppColors.warningColor.withOpacity(0.7),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    );
  }

  // @usage:  ShowCustomSnackBar.error(context,"title..","message...");
  //for Error
  static error(
      {String title = "Error!!", String message = "Something went wrong!"}) {
    Get.closeCurrentSnackbar();

    Get.snackbar(
      titleText: Text(
        title,
        style: FontStyle.manrope(18, FontWeight.w600)
            .copyWith(color: AppColors.blackColor),
      ),
      messageText: Text(
        message,
        style: FontStyle.manrope(15, FontWeight.w400)
            .copyWith(color: AppColors.titleColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      title,
      message,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.black,
        size: 35,
      ),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 7,
      overlayColor: AppColors.errorColor,
      backgroundColor: AppColors.errorColor.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    );
  }

  static success({String title = "Hurray!", String message = "Successfull!"}) {
    Get.closeCurrentSnackbar();

    Get.snackbar(
      titleText: Text(
        title,
        style: FontStyle.manrope(18, FontWeight.w600)
            .copyWith(color: AppColors.blackColor),
      ),
      messageText: Text(
        message,
        style: FontStyle.manrope(15, FontWeight.w400)
            .copyWith(color: AppColors.titleColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      title,
      message,
      icon: const Icon(
        Icons.done,
        color: Colors.black,
        size: 35,
      ),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 7,
      overlayColor: AppColors.sucessColor,
      backgroundColor: AppColors.sucessColor.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    );
  }

  static noInternet() {
    Get.closeCurrentSnackbar();

    Get.snackbar(
      titleText: Text(
        'Oops!',
        style: FontStyle.manrope(18, FontWeight.w600)
            .copyWith(color: AppColors.blackColor),
      ),
      messageText: Text(
        "You are offline!",
        style: FontStyle.manrope(15, FontWeight.w400)
            .copyWith(color: AppColors.titleColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      "Oops!",
      "You are offline!",
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.black,
        size: 35,
      ),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 10,
      overlayColor: AppColors.noInternetColor,
      backgroundColor: AppColors.noInternetColor.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      isDismissible: false,
      duration: const Duration(days: 1),
    );
  }

  static activeInternet() {
    Get.closeCurrentSnackbar();

    Get.snackbar(
      titleText: Text(
        'Hurray!',
        style: FontStyle.manrope(18, FontWeight.w600)
            .copyWith(color: AppColors.blackColor),
      ),
      messageText: Text(
        "Active connection!",
        style: FontStyle.manrope(15, FontWeight.w400)
            .copyWith(color: AppColors.titleColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      "Hurray!",
      "Active connection!",
      icon: const Icon(
        Icons.wifi,
        color: Colors.black,
        size: 35,
      ),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 10,
      overlayColor: AppColors.sucessColor,
      backgroundColor: AppColors.sucessColor.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      isDismissible: true,
    );
  }
}
