import 'package:flutter/animation.dart';

import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

final AppColors _colors = AppColors();

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
    color: _colors.lightMossGreenColor,
    title: 'Academic Curriculum',
    body: 'Explore your syllabus of each and every subject.',
    image: syllabusImg,
  ),
  IntroductionScreenData(
    color: _colors.lavenderColor,
    title: 'Previous Question Papers',
    body: 'Solve more, clear all the concepts and boost your grades.',
    image: questionPaperImg,
  ),
  IntroductionScreenData(
    color: _colors.lightYellowColor,
    title: 'GTU\nCirculars',
    body: 'Stay up-to-date with all the GTU announcements.',
    image: circularImg,
  ),
  IntroductionScreenData(
    color: _colors.lightRedColor,
    title: 'Exam\nTimetable',
    body: 'Save your exam dates to excel in every exam.',
    image: examTimetableImg,
  ),
];
