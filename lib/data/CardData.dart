// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

import 'package:gtu_app/image.dart';
import 'package:gtu_app/screens/questionPaperScreen.dart';
import 'package:gtu_app/style.dart';

final AppColors _colors = AppColors();

class CardData {
  String id;
  String title;
  String tagline;
  Color color;
  String image;
  String onTapLink;

  String pageTitle;
  String pageSubtitle;
  String pageLink;

  CardData({
    required this.id,
    required this.title,
    required this.tagline,
    required this.color,
    required this.image,
    required this.onTapLink,
    required this.pageTitle,
    required this.pageSubtitle,
    required this.pageLink,
  });
}

CardData searchResultScreen = CardData(
    id: 'Search Result Screen',
    title: '',
    tagline: '',
    color: _colors.lavenderColor,
    image: searchImg,
    onTapLink: '',
    pageTitle: '3110005 📖', //pass subject code here
    pageSubtitle: 'Basic Electrical Engineering ', //pass subject name here
    pageLink: '');

CardData syllabus = CardData(
    id: 'Syllabus Screen',
    title: 'Syllabus',
    tagline: '',
    color: _colors.lightMossGreenColor,
    image: syllabusImg,
    onTapLink: '',
    pageTitle: 'Syllabus 📖',
    pageSubtitle: '',
    pageLink: '');

CardData questionPaper = CardData(
    id: 'Question Paper Screen',
    title: 'Question Paper',
    tagline: '',
    color: _colors.lavenderColor,
    image: questionPaperImg,
    onTapLink: '',
    pageTitle: 'Question Paper 📋',
    pageSubtitle: '',
    pageLink: '');

CardData result = CardData(
    id: 'Result Screen',
    title: 'Result',
    tagline: 'All you need is here',
    color: _colors.waterBlueColor,
    image: resultImg,
    onTapLink: '',
    pageTitle: 'Result 📊',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/result.aspx');

CardData circular = CardData(
    id: 'Circular Screen',
    title: 'Circular',
    tagline: '',
    color: _colors.lightYellowColor,
    image: circularImg,
    onTapLink: '',
    pageTitle: 'Circular 📃',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/Circular.aspx' //pass link here
    );

CardData academicCalendar = CardData(
    id: 'Academic Calendar Screen',
    title: 'Academic Calendar',
    tagline: '',
    color: _colors.lightOrangeColor,
    image: academicCalendarImg,
    onTapLink: '',
    pageTitle: 'Academic Calendar 📆',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/AcademicCal.aspx' //pass link here
    );

CardData studentCorner = CardData(
    id: 'Student Corner Screen',
    title: 'Student Corner',
    tagline: '',
    color: _colors.lightPinkColor,
    image: studentCornerImg,
    onTapLink: 'https://www.gtu.ac.in/StudentCorner.aspx',
    pageTitle: 'Student Corner 📪',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/StudentCorner.aspx' //pass link here
    );

CardData examTimetable = CardData(
    id: 'Exam Timetable Screen',
    title: 'Exam Timetable',
    tagline: '',
    color: _colors.lightRedColor,
    image: examTimetableImg,
    onTapLink: '',
    pageTitle: 'Exam Timetable ⏰',
    pageSubtitle: '',
    pageLink: 'https://gtu.ac.in/Timetable/' // pass link here
    );

CardData pointActivity = CardData(
    id: '100 Point Activity',
    title: 'Point Activity',
    tagline: '',
    color: _colors.lightPistaColor,
    image: pointActivityImg,
    onTapLink: 'https://www.100points.gtu.ac.in', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData studentPortal = CardData(
    id: 'Student Portal',
    title: 'Student Portal',
    tagline: '',
    color: _colors.lightGreenColor,
    image: studentPortalImg,
    onTapLink: 'https://student.gtu.ac.in/Login.aspx', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

// 4 cards of Result page

CardData resultTile = CardData(
    id: 'Result',
    title: 'Result',
    tagline: '',
    color: _colors.lightMossGreenColor,
    image: resultImageImg,
    onTapLink: 'https://www.gturesults.in', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData midMarks = CardData(
    id: 'Mid marks',
    title: 'Internal/Mid Marks',
    tagline: '',
    color: _colors.lavenderColor,
    image: midMarksImg,
    onTapLink:
        'https://www.me.gtu.ac.in/student/Studentmarkdisplay.aspx', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData gradeHistory = CardData(
    id: 'Grade History',
    title: 'Grade History',
    tagline: '',
    color: _colors.lightlavenderColor,
    image: gradeHistoryImg,
    onTapLink: 'https://www.students.gtu.ac.in', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData percentageCalculator = CardData(
    id: 'Percentage Calculator Screen',
    title: 'Percentage Calculator',
    tagline: '',
    color: _colors.lightOrangeColor,
    image: percentageCalculatorImg,
    onTapLink: '',
    pageTitle: 'Percentage Calculator 💯',
    pageSubtitle: '',
    pageLink: '');

// Profile and setting page header data

CardData profileScreen = CardData(
    id: 'Profile Screen',
    title: '',
    tagline: '',
    color: _colors.whiteColor,
    image: profileImageImg,
    onTapLink: '',
    pageTitle: 'Profile 🗂',
    pageSubtitle: '',
    pageLink: '');

CardData settingScreen = CardData(
    id: 'Setting Screen',
    title: '',
    tagline: '',
    color: _colors.whiteColor,
    image: settingImg,
    onTapLink: '',
    pageTitle: 'Settings ⚙️',
    pageSubtitle: '',
    pageLink: '');
