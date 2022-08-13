import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gtu_app/components/custom_loading_indicator.dart';

import 'package:gtu_app/components/custom_snackbar.dart';
import 'package:gtu_app/components/dropdown_menu.dart';
import 'package:gtu_app/components/exam_timetable_tile.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/no_data_found.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/controllers/timetable_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/data/dummy_exam_timetable_data.dart';
import 'package:gtu_app/models/timetable_model.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/style/style.dart';

class ExamTimetableScreen extends StatefulWidget {
  const ExamTimetableScreen({super.key});

  @override
  State<ExamTimetableScreen> createState() => _ExamTimetableScreenState();
}

class _ExamTimetableScreenState extends State<ExamTimetableScreen> {
  final timeTableController = Get.put(TimeTableController());

  String? value;

  @override
  Widget build(BuildContext context) {
    TextStyle style = FontStyle.montserrat(16, FontWeight.w600);

    return WillPopScope(
      onWillPop: AppGlobals.onBackPressed,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.bgColor,
          body: SafeArea(
              child: Column(children: [
            Header(card: examTimetable),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                    padding: padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InputSection2(style: style),
                        timeTableController.obx(
                            (state) => ListView.separated(
                                  itemCount: state.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    TimeTableModel timetableData =
                                        TimeTableModel.fromJson(state[index]);
                                    return ExamTimetableTile(
                                        data: timetableData);
                                  },
                                ),
                            onLoading: CustomLoadingIndicator(),
                            onError: (error) => NoDataFound(
                                  error: error,
                                )),
                        PoweredbyAstronApps()
                      ],
                    )),
              ),
            ),
          ]))),
    );
  }
}

class InputSection2 extends StatelessWidget {
  late final TextEditingController _controller;
  late TextStyle style;
  final timeTableController = Get.put(TimeTableController());
  final semController = Get.put(SemController());
  final signInController = Get.put(SignInController());

  InputSection2({super.key, required this.style}) {
    _controller = TextEditingController(
        text: signInController.dbUserData.value.branchCode);
  }

  onSearchHandler() {
    if (_controller.text.length < 2) {
      ShowCustomSnackBar.warn(
          title: "Invalid Input",
          message: "E.g. If your branch code is '3' then enter '03'");
      return;
    }
    timeTableController.fetchTimeTableData(_controller.text);
  }

  searchButton() {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: () {
            onSearchHandler();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Center(
              child: Text(
            'Search',
            style: FontStyle.montserrat(20, FontWeight.w600)
                .copyWith(color: AppColors.whiteColor),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget semSelector = semController.obx(
      (state) => DropDownMenu(
        item: state ?? ["No data found"],
        hintText: state[0] ?? "Sem",
        width: 0.4,
        customOnChange: semController.changeSem,
      ),
      onError: (error) => Text("Error in loading Sem."),
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
                      color: AppColors.whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        controller: _controller,
                        maxLength: 4,
                        style: FontStyle.montserrat(15, FontWeight.normal),
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
                    ),
                  ),
                ],
              )
            ],
          ),
          searchButton()
        ],
      ),
    );
  }
}
