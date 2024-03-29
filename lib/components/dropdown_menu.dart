import 'package:flutter/material.dart';

import 'package:gtu_app/style/style.dart';

// ignore: must_be_immutable
class DropDownMenu extends StatefulWidget {
  List<dynamic> item;
  String hintText;
  double width;
  Function customOnChange;

  DropDownMenu({
    Key? key,
    required this.item,
    required this.hintText,
    required this.width,
    required this.customOnChange,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? value;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width * widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppColors.whiteColor),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            widget.hintText,
            maxLines: 2, // max line of hint text in dropdown
            overflow: TextOverflow.ellipsis,
          ),
          value: value,
          items: widget.item.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() {
            this.value = value;
            widget.customOnChange(value);
          }),
          menuMaxHeight: 250,
          isExpanded: true,
          iconSize: 30,
          icon: Icon(
            Icons.expand_more,
            color: AppColors.titleColor,
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(dynamic item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: FontStyle.montserrat(15, FontWeight.normal),
          maxLines: 2, // max line of selected item from dropdown menu
          overflow: TextOverflow.ellipsis,
        ),
      );
}
