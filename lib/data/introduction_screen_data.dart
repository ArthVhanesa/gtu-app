import 'package:flutter/animation.dart';

import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class IntroductionScreenData {
  Color color;
  String title;
  String body;
  String image;
  IntroductionScreenData({
    required this.color,
    required this.title,
    required this.body,
    required this.image,
  });
}

List<IntroductionScreenData> introductionScreenData = [
  IntroductionScreenData(
    color: AppColors.lightMossGreenColor,
    title: 'Academic Curriculum',
    body: 'Explore your syllabus of each and every subject.',
    image: AppImage.syllabusImg,
  ),
  IntroductionScreenData(
    color: AppColors.lavenderColor,
    title: 'Previous Question Papers',
    body: 'Solve more, clear all the concepts and boost your grades.',
    image: AppImage.questionPaperImg,
  ),
  IntroductionScreenData(
    color: AppColors.lightYellowColor,
    title: 'GTU\nCirculars',
    body: 'Stay up-to-date with all the GTU announcements.',
    image: AppImage.circularImg,
  ),
  IntroductionScreenData(
    color: AppColors.lightRedColor,
    title: 'Exam\nTimetable',
    body: 'Save your exam dates to excel in every exam.',
    image: AppImage.examTimetableImg,
  ),
];
