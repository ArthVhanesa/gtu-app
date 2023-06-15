import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

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
    color: AppColors.lavenderColor,
    image: AppImage.searchImg,
    onTapLink: '',
    pageTitle: 'Search 🔍', //pass subject code here
    pageSubtitle: '', //pass subject name here
    pageLink: '');

CardData syllabus = CardData(
    id: 'Syllabus Screen',
    title: 'Syllabus',
    tagline: '',
    color: AppColors.lightMossGreenColor,
    image: AppImage.syllabusImg,
    onTapLink: '',
    pageTitle: 'Syllabus 📖',
    pageSubtitle: '',
    pageLink: '');

CardData questionPaper = CardData(
    id: 'Question Paper Screen',
    title: 'Question Paper',
    tagline: '',
    color: AppColors.lavenderColor,
    image: AppImage.questionPaperImg,
    onTapLink: '',
    pageTitle: 'Question Paper 📋',
    pageSubtitle: '',
    pageLink: '');

CardData result = CardData(
    id: 'Result Screen',
    title: 'Result',
    tagline: 'All you need is here',
    color: AppColors.waterBlueColor,
    image: AppImage.resultImg,
    onTapLink: '',
    pageTitle: 'Result 📊',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/result.aspx');

CardData circular = CardData(
    id: 'Circular Screen',
    title: 'Circular',
    tagline: '',
    color: AppColors.lightYellowColor,
    image: AppImage.circularImg,
    onTapLink: '',
    pageTitle: 'Circular 📃',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/Circular.aspx' //pass link here
    );

CardData academicCalendar = CardData(
    id: 'Academic Calendar Screen',
    title: 'Academic Calendar',
    tagline: '',
    color: AppColors.lightOrangeColor,
    image: AppImage.academicCalendarImg,
    onTapLink: '',
    pageTitle: 'Academic Calendar 📆',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/AcademicCal.aspx' //pass link here
    );

CardData studentCorner = CardData(
    id: 'Student Corner Screen',
    title: 'Student Corner',
    tagline: '',
    color: AppColors.lightRedColor,
    image: AppImage.studentCornerImg,
    onTapLink: 'https://www.gtu.ac.in/StudentCorner.aspx',
    pageTitle: 'Student Corner 📪',
    pageSubtitle: '',
    pageLink: 'https://www.gtu.ac.in/StudentCorner.aspx' //pass link here
    );

CardData examTimetable = CardData(
    id: 'Exam Timetable Screen',
    title: 'Exam Timetable',
    tagline: '',
    color: AppColors.lightPinkColor,
    image: AppImage.examTimetableImg,
    onTapLink: '',
    pageTitle: 'Exam Timetable ⏰',
    pageSubtitle: '',
    pageLink: 'https://gtu.ac.in/Timetable/' // pass link here
    );

CardData pointActivity = CardData(
    id: '100 Point Activity',
    title: 'Point Activity',
    tagline: '',
    color: AppColors.lightPistaColor,
    image: AppImage.pointActivityImg,
    onTapLink: 'https://www.100points.gtu.ac.in', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData studentPortal = CardData(
    id: 'Student Portal',
    title: 'Student Portal',
    tagline: '',
    color: AppColors.lightGreenColor,
    image: AppImage.studentPortalImg,
    onTapLink: 'https://student.gtu.ac.in/Login.aspx', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

// 4 cards of Result page

CardData resultTile = CardData(
    id: 'Result',
    title: 'Result',
    tagline: '',
    color: AppColors.lightMossGreenColor,
    image: AppImage.resultImageImg,
    onTapLink: 'https://www.gturesults.in', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData midMarks = CardData(
    id: 'Mid marks',
    title: 'Internal/Mid Marks',
    tagline: '',
    color: AppColors.lavenderColor,
    image: AppImage.midMarksImg,
    onTapLink:
        'https://www.me.gtu.ac.in/student/Studentmarkdisplay.aspx', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData gradeHistory = CardData(
    id: 'Grade History',
    title: 'Grade History',
    tagline: '',
    color: AppColors.lightlavenderColor,
    image: AppImage.gradeHistoryImg,
    onTapLink: 'https://www.students.gtu.ac.in', //pass link here

    pageTitle: '',
    pageSubtitle: '',
    pageLink: '');

CardData percentageCalculator = CardData(
    id: 'Percentage Calculator Screen',
    title: 'Percentage Calculator',
    tagline: '',
    color: AppColors.lightOrangeColor,
    image: AppImage.percentageCalculatorImg,
    onTapLink: '',
    pageTitle: 'Percentage Calculator 💯',
    pageSubtitle: '',
    pageLink: '');

// Profile and setting page header data

CardData profileScreen = CardData(
    id: 'Profile Screen',
    title: '',
    tagline: '',
    color: AppColors.whiteColor,
    image: AppImage.profileImageImg,
    onTapLink: '',
    pageTitle: 'Profile 🗂',
    pageSubtitle: '',
    pageLink: '');

CardData settingScreen = CardData(
    id: 'Setting Screen',
    title: '',
    tagline: '',
    color: AppColors.whiteColor,
    image: AppImage.settingImg,
    onTapLink: '',
    pageTitle: 'Settings ⚙️',
    pageSubtitle: '',
    pageLink: '');
