import 'package:flutter/material.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/screens/academicCalendarScreen.dart';
import 'package:gtu_app/screens/circularScreen.dart';
import 'package:gtu_app/screens/examTimetableScreen.dart';
import 'package:gtu_app/screens/percentageCalculatorScreen.dart';
import 'package:gtu_app/screens/questionPaperScreen.dart';
import 'package:gtu_app/screens/resultScreen.dart';
import 'package:gtu_app/screens/studentCornerScreen.dart';
import 'package:gtu_app/screens/syllabusScreen.dart';

class ScreenRoute extends StatefulWidget {
  final CardData card;
  const ScreenRoute({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<ScreenRoute> createState() => _ScreenRouteState();
}

class _ScreenRouteState extends State<ScreenRoute> {
  @override
  Widget build(BuildContext context) {
    switch (widget.card.id) {
      case 'Syllabus Screen':
        return const SyllabusScreen();

      case 'Question Paper Screen':
        return const QuestionPaperScreen();

      case 'Result Screen':
        return const ResultScreen();

      case 'Circular Screen':
        return const CircularScreen();

      case 'Academic Calendar Screen':
        return AcademicCalendarScreen();

      case 'Student Corner Screen':
        return const StudentCornerScreen();

      case 'Exam Timetable Screen':
        return const ExamTimetableScreen();

      case 'Percentage Calculator Screen':
        return const PercentageCalculatorScreen();

      default:
        return const Center(child: Text('Oops... Something went wrong'));
    }
  }
}
