// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/style.dart';

class DropDownMenu extends StatefulWidget {
  List<String> item;
  String hintText;
  double width;
  DropDownMenu({
    Key? key,
    required this.item,
    required this.hintText,
    required this.width,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  final AppColors _colors = AppColors();

  final FontStyle _fontStyle = FontStyle();

  String? value;

  @override
  Widget build(BuildContext context) {
    TextStyle style = _fontStyle.montserrat(16, FontWeight.w600);

    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width * widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: _colors.whiteColor),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(widget.hintText),
          value: value,
          items: widget.item.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() {
            this.value = value;
          }),
          isExpanded: true,
          iconSize: 30,
          icon: Icon(
            Icons.expand_more,
            color: _colors.titleColor,
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: _fontStyle.montserrat(15, FontWeight.normal),
        ),
      );
}
