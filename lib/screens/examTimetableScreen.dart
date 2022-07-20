// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gtu_app/components/CommonTile.dart';
import 'package:gtu_app/components/DropDownMenu.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/components/TextInput.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/DummyCommonCardData.dart';
import 'package:gtu_app/data/ExamTimetable.dart';
import 'package:gtu_app/style.dart';

class ExamTimetableScreen extends StatefulWidget {
  const ExamTimetableScreen({super.key});

  @override
  State<ExamTimetableScreen> createState() => _ExamTimetableScreenState();
}

class _ExamTimetableScreenState extends State<ExamTimetableScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final TextEditingController _controller = TextEditingController();

  String? value;

  @override
  Widget build(BuildContext context) {
    TextStyle style = _fontStyle.montserrat(16, FontWeight.w600);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: examTimetable),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dropDownMenus(style, context),
                    ListView.separated(
                      itemCount: examTimetableData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ExamTimetableTile(
                            data: examTimetableData[index]);
                      },
                    ),
                    PoweredbyAstronApps()
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  dropDownMenus(TextStyle style, BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //column for brach select
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exam',
                style: style,
              ),
              const SizedBox(
                height: 10,
              ),
              DropDownMenu(
                item: course,
                hintText: 'Choose a Branch',
                width: 1.0,
              ),
            ],
          ),
          //row for sem & branch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sem',
                    style: style,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMenu(
                    item: sem,
                    hintText: 'Sem',
                    width: 0.4,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Branch',
                    style: style,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: _colors.whiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: _controller,
                          maxLength: 4,
                          style: _fontStyle.montserrat(15, FontWeight.normal),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                          ],
                          decoration: const InputDecoration(
                              hintText: "Branch code",
                              counterText: '',
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,
                        ),
                      ))
                ],
              )
            ],
          ),
          searchButton()
        ],
      ),
    );
  }

  searchButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: _colors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Center(
            child: Text(
          'Search',
          style: _fontStyle
              .montserrat(20, FontWeight.w600)
              .copyWith(color: _colors.whiteColor),
        )),
      ),
    );
  }
}

class ExamTimetableTile extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  ExamTimetableData data;

  ExamTimetableTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 105,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: _colors.questionPaperTileColor,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
                color: _colors.bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.date.substring(0, 2),
                  style: _fontStyle.manrope(28, FontWeight.w700),
                ),
                Text(
                  data.date.substring(3, 11),
                  style: _fontStyle.manrope(12, FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  '${data.subCode} (${data.marks} Marks)',
                  style: _fontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                ),
                AutoSizeText(
                  data.subName,
                  style: _fontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                ),
                AutoSizeText(
                  data.time,
                  style: _fontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
