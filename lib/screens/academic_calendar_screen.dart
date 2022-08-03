import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/common_tile.dart';
import 'package:gtu_app/components/custom_loading_indicator.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/controllers/calendar_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/data/dummy_common_card_data.dart';
import 'package:gtu_app/models/circular_model.dart';
import 'package:gtu_app/style/style.dart';

class AcademicCalendarScreen extends StatelessWidget {
  final AppColors _colors = AppColors();

  AcademicCalendarScreen({super.key});

  final controller = Get.put(AcademicCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: academicCalendar),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  controller.obx(
                    (calendarData) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: dummyCommonCardData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return CommonTile(
                            commonCardData:
                                CircularModel.fromJson(calendarData[index]),
                          );
                        },
                      );
                    },
                    onLoading: CustomLoadingIndicator(),
                  ),
                  PoweredbyAstronApps()
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
