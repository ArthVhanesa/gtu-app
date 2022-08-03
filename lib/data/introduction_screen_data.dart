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
    title: 'Get notifications when there’s a case',
    body:
        'A notification will be sent to all students along with an incident report.',
    image: syllabusImg,
  ),
  IntroductionScreenData(
    color: _colors.lightRedColor,
    title: 'Get notifications when there’s a case',
    body:
        'A notification will be sent to all students along with an incident report.',
    image: examTimetableImg,
  ),
  IntroductionScreenData(
    color: _colors.lightYellowColor,
    title: 'Get notifications when there’s a case',
    body:
        'A notification will be sent to all students along with an incident report.',
    image: circularImg,
  ),
  IntroductionScreenData(
    color: _colors.lavenderColor,
    title: 'Get notifications when there’s a case',
    body:
        'A notification will be sent to all students along with an incident report.',
    image: questionPaperImg,
  ),
];
