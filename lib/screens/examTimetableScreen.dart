// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gtu_app/components/CustomSnackBar.dart';
import 'package:gtu_app/components/DropDownMenu.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/controllers/timetable_controller.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/ExamTimetable.dart';
import 'package:gtu_app/main.dart';
import 'package:gtu_app/models/timetable_model.dart';
import 'package:gtu_app/provider/globals.dart';
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
  final timeTableController = Get.put(TimeTableController());

  String? value;

  @override
  Widget build(BuildContext context) {
    TextStyle style = _fontStyle.montserrat(16, FontWeight.w600);

    return WillPopScope(
        onWillPop: AppGlobals.onBackPressed,
        child: Scaffold(
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
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dropDownMenus(style, context),
                            ListView.separated(
                              itemCount: timeTableController
                                  .timeTableData.value.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                TimeTableModel timetableData =
                                    TimeTableModel.fromJson(timeTableController
                                        .timeTableData.value[index]);
                                return ExamTimetableTile(data: timetableData);
                              },
                            ),
                            PoweredbyAstronApps()
                          ],
                        )),
                  ),
                ),
              )
            ],
          )),
        ));
  }

  dropDownMenus(TextStyle style, BuildContext context) {
    final timeTableController = Get.put(TimeTableController());

    Widget semSelector = timeTableController.obx(
      (state) => DropDownMenu(
        item: state['sem'] ?? ["No data found"],
        hintText: state['sem'][0] ?? "Sem",
        width: 0.4,
        customOnChange: timeTableController.changeSem,
      ),
      onError: (error) => Text("Error loading Sem."),
    );

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
                hintText: course[0],
                width: 1.0,
                customOnChange: (p0) => {},
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
                  semSelector
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
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            LengthLimitingTextInputFormatter(2)
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
    onSearchHandler() {
      if (_controller.text.length < 2) {
        ShowCustomSnackBar.warn(
            title: "Invalid Input", message: "Enter correct branch code.");
        return;
      }
      timeTableController.fetchTimeTableData(_controller.text);
    }

    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: _colors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: () {
            onSearchHandler();
          },
          child: Center(
              child: Text(
            'Search',
            style: _fontStyle
                .montserrat(20, FontWeight.w600)
                .copyWith(color: _colors.whiteColor),
          )),
        ),
      ),
    );
  }
}

class ExamTimetableTile extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  TimeTableModel data;

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
                  data.date!.substring(0, 2),
                  style: _fontStyle.manrope(28, FontWeight.w700),
                ),
                Text(
                  data.date!.substring(3, 11),
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
                  '${data.subcode}',
                  style: _fontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                ),
                AutoSizeText(
                  data.subname ?? "",
                  style: _fontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                ),
                AutoSizeText(
                  data.time ?? "",
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
