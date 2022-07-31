import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/Heading.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/components/SyllabusTile.dart';
import 'package:gtu_app/controllers/syllabus_controller.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/DummyDataQuestionPaper.dart';
import 'package:gtu_app/models/syllabus_model.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({super.key});

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final _syllabusController = Get.put(SyllabusController());
  final TextEditingController _syllabusInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppGlobals.onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _colors.bgColor,
        body: SafeArea(
            child: Column(
          children: [
            Header(
              card: syllabus,
            ),
            Padding(
              padding: padding,
              child: SearchBar(
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
                        ),
                        PoweredbyAstronApps()
                      ],
                    ),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
