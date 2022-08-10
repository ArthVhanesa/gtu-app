import 'package:flutter/material.dart';

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
}

class CustomSnackBar extends StatelessWidget {
  String title;
  String message;
  SnackBarType snackBarType;

  CustomSnackBar({
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
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
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

class ShowCustomSnackBar {
  // @usage:  ShowCustomSnackBar.warn(context,"title..","message...");
  //for warning
  static warn({String title = "Oops!!", String message = ""}) {
    //remove old snackbars before showing new one.
    AppGlobals.rootScaffoldMessengerKey.currentState!.clearSnackBars();

    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBar(
          title: title, message: message, snackBarType: SnackBarType.warning),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  // @usage:  ShowCustomSnackBar.error(context,"title..","message...");
  //for Error
  static error(
      {String title = "Error!!", String message = "Something went wrong!"}) {
    AppGlobals.rootScaffoldMessengerKey.currentState!.clearSnackBars();
    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBar(
          title: title, message: message, snackBarType: SnackBarType.error),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  static success({String title = "Hurray!", String message = "Successfull!"}) {
    AppGlobals.rootScaffoldMessengerKey.currentState!.clearSnackBars();
    AppGlobals.rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: CustomSnackBar(
          title: title, message: message, snackBarType: SnackBarType.success),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
