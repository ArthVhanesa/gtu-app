import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gtu_app/style/style.dart';

class SearchBar extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final TextEditingController searchInputController;

  void Function() onTap;
  void Function(String) onSubmitted;

  SearchBar({
    Key? key,
    required this.searchInputController,
    required this.onTap,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: _colors.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: searchInputController,
                  onSubmitted: onSubmitted,
                  textInputAction: TextInputAction.done,
                  maxLength: 7,
                  style: _fontStyle.montserrat(16, FontWeight.normal),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  decoration: const InputDecoration(
                      hintText: "Search subject code",
                      counterText: '',
                      border: InputBorder.none),
                  keyboardType: TextInputType.number,
                ),
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: _colors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: onTap,
              child: Icon(
                Icons.search,
                color: _colors.whiteColor,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
