import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtu_app/style.dart';

class SearchBar extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final TextEditingController _subjectCode = TextEditingController();

  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: _colors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _subjectCode,
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
        InkWell(
          onTap: () => print('search button clicked'),
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: _colors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.search,
              color: _colors.whiteColor,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
