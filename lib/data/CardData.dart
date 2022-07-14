// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/style.dart';

final AppColors _colors = AppColors();

class CardData {
  String title;
  String tagline;
  String subTitle;
  Color color;
  String image;

  CardData({
    required this.title,
    required this.tagline,
    required this.subTitle,
    required this.color,
    required this.image,
  });
}

CardData syllabus = CardData(
    title: 'Syllabus',
    tagline: '',
    subTitle: '',
    color: _colors.lightMossGreenColor,
    image: syllabusImg);

CardData questionPaper = CardData(
    title: 'Question Paper',
    tagline: '',
    subTitle: '',
    color: _colors.lavenderColor,
    image: questionPaperImg);

CardData result = CardData(
    title: 'Result',
    tagline: 'All you need is here',
    subTitle: '',
    color: _colors.waterBlueColor,
    image: resultImg);

CardData circular = CardData(
    title: 'Circular',
    tagline: '',
    subTitle: '',
    color: _colors.lightYellowColor,
    image: circularImg);

CardData academicCalender = CardData(
    title: 'Academic Calender',
    tagline: '',
    subTitle: '',
    color: _colors.lightOrangeColor,
    image: academicCalenderImg);

CardData studentCorner = CardData(
    title: 'Student',
    tagline: '',
    subTitle: 'Corner',
    color: _colors.lightPinkColor,
    image: studentCornerImg);

CardData examTimetable = CardData(
    title: 'Exam Timetable',
    tagline: '',
    subTitle: '',
    color: _colors.lightRedColor,
    image: examTimetableImg);

CardData pointActivity = CardData(
    title: 'Point Activity',
    tagline: '',
    subTitle: '',
    color: _colors.lightPistaColor,
    image: pointActivityImg);

CardData studentPortal = CardData(
    title: 'Student',
    tagline: '',
    subTitle: 'Portal',
    color: _colors.lightGreenColor,
    image: studentPortalImg);

// 4 cards of Result page

CardData resultTile = CardData(
    title: 'Result',
    tagline: '',
    subTitle: '',
    color: _colors.lightMossGreenColor,
    image: resultImageImg);

CardData midMarks = CardData(
    title: 'Internal/Mid Marks',
    tagline: '',
    subTitle: '',
    color: _colors.lavenderColor,
    image: midMarksImg);

CardData gradeHistory = CardData(
    title: 'Grade History',
    tagline: '',
    subTitle: '',
    color: _colors.lightlavenderColor,
    image: gradeHistoryImg);

CardData percentageCalculator = CardData(
    title: 'Percentage Calculator',
    tagline: '',
    subTitle: '',
    color: _colors.lightOrangeColor,
    image: percentageCalculatorImg);
    

// class TitleData {
//   String? title;
//   CardData? card1;
//   CardData? card2;
//   CardData? card3;
//   TitleData({
//     this.title,
//     this.card1,
//     this.card2,
//     this.card3,
//   });
// }
