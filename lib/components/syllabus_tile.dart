import 'package:flutter/material.dart';

import 'package:gtu_app/components/modal_bottom_column_four.dart';
import 'package:gtu_app/components/modal_bottom_column_three.dart';
import 'package:gtu_app/models/syllabus_model.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/launch_tab.dart';

// ignore: must_be_immutable
class SyllabusTile extends StatelessWidget {
  SyllabusModel syllabus;

  SyllabusTile({
    Key? key,
    required this.syllabus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.syllabusTileColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          onTap: () => {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: AppColors.bgColor,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              builder: (context) => ModalBottomSheet(
                syllabus: syllabus,
              ),
            ),
            FocusManager.instance.primaryFocus?.unfocus(),
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        syllabus.subcode ??
                            "Subject code not found.", //pass subject code
                        style: FontStyle.montserrat(16, FontWeight.w600),
                      ),
                      Text(
                        syllabus.subname ??
                            "subject name not available.", //pass subject name
                        style: FontStyle.manrope(13, FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.folder_open_sharp,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ModalBottomSheet extends StatelessWidget {
  SyllabusModel syllabus;

  ModalBottomSheet({Key? key, required this.syllabus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.titleColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        syllabus.subcode ?? "Subcode",
                        style: FontStyle.montserrat(20, FontWeight.w600),
                      ),
                      Text(
                        syllabus.subname ?? "Subname",
                        style: FontStyle.manrope(16, FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.folder_open_sharp,
                  size: 30,
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.blackColor,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 440,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalBottomColumnThree(
                    color: AppColors.skyBlueColor,
                    title:
                        'Category: ${syllabus.category}', //example=> title: 'Category: $category_of_subject'
                    boxTitle1: 'Branch',
                    boxInt1: syllabus.branchcode ?? "", //pass branch code here
                    boxTitle2: 'Sem',
                    boxInt2: syllabus.sem ?? "", // pass sem here
                    boxTitle3: 'Credit',
                    boxInt3: syllabus.totalcredit ?? "", // pass credit here
                  ),
                  ModalBottomColumnThree(
                    color: AppColors.orangeColor,
                    title: 'Teaching Hours (Weekly)', //no change
                    boxTitle1: 'Lecture',
                    boxInt1: syllabus.l ?? "", //pass Lecture hours here
                    boxTitle2: 'Tutorial',
                    boxInt2: syllabus.t ?? "", // pass Tutorial hours here
                    boxTitle3: 'Practical',
                    boxInt3: syllabus.p ?? "", // pass Practical hours here
                  ),
                  ModalBottomColumnFour(
                    color: AppColors.pistaColor,
                    title: 'Evalution out of 150 Marks', //no change
                    boxTitle1: 'End Sem',
                    boxInt1: syllabus.e ?? "", //pass End Sem marks here
                    boxTitle2: 'Mid Sem',
                    boxInt2: syllabus.m ?? "", // pass Mid Sem marks here
                    boxTitle3: 'Internal',
                    boxInt3: syllabus.i ?? "", // pass Internal marks here
                    boxTitle4: 'Viva',
                    boxInt4: syllabus.v ?? "", // pass viva marks here
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        onTap: () {
                          launchTab(syllabus.pdflink ?? "");
                        },
                        child: Center(
                            child: Text(
                          'View Syllabus',
                          style: FontStyle.montserrat(20, FontWeight.w600)
                              .copyWith(color: AppColors.whiteColor),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
