import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/CustomSearchBar.dart';
import 'package:gtu_app/components/custom_loading_indicator.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/heading.dart';
import 'package:gtu_app/components/no_data_found.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/components/syllabus_tile.dart';
import 'package:gtu_app/controllers/syllabus_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/models/syllabus_model.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/style/style.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({super.key});

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  final _syllabusController = Get.put(SyllabusController());
  final TextEditingController _syllabusInputController =
      TextEditingController();

  _SyllabusScreenState() {
    _syllabusController.initialFetch();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // Get.delete<SyllabusController>();
        return AppGlobals.onBackPressed();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
            child: Column(
          children: [
            Header(
              card: syllabus,
            ),
            Padding(
              padding: padding,
              child: CustomSearchBar(
                searchInputController: _syllabusInputController,
                onTap: () {
                  _syllabusController
                      .fetchSearchedSyllabus(_syllabusInputController.text);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onSubmitted: (p0) {
                  _syllabusController.fetchSearchedSyllabus(p0);
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: padding,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Heading(
                        heading: 'Your subject syllabus',
                      ),
                      _syllabusController.obx(
                        (state) => ListView.separated(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: state.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return SyllabusTile(
                              syllabus: SyllabusModel.fromJson(state[index]),
                            );
                          },
                        ),
                        onLoading: CustomLoadingIndicator(),
                        // onError widget
                        onError: (error) => NoDataFound(error: error),
                      ),
                      PoweredbyAstronApps()
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
