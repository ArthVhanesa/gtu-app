import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gtu_app/style/style.dart';

class TextInput extends StatelessWidget {
  final double width;
  final int maxLength;
  final String hintText;
  final String titleName;
  final TextInputType keyboardType;
  final RegExp textInputFormatter;
  final TextEditingController controller;

  TextInput({
    Key? key,
    required this.width,
    required this.maxLength,
    required this.hintText,
    required this.titleName,
    required this.keyboardType,
    required this.textInputFormatter,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleName, style: FontStyle.manrope(20, FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: width,
            height: 80,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: AppColors.blackColor,
                  width: 4,
                )),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: controller,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(textInputFormatter),
                  ],
                  // maxLengthEnforcement: maxLengthEnforcement,
                  maxLength: maxLength,
                  style: FontStyle.manrope(18, FontWeight.normal),
                  decoration: InputDecoration(
                      hintText: hintText,
                      counterText: '',
                      border: InputBorder.none),
                  keyboardType: keyboardType,
                ),
              ),
            )),
      ],
    );
  }
}
