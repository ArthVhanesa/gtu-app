import 'package:flutter/material.dart';

import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/screens/academic_calendar_screen.dart';
import 'package:gtu_app/screens/circular_screen.dart';
import 'package:gtu_app/screens/exam_timetable_screen.dart';
import 'package:gtu_app/screens/percentage_calculator_screen.dart';
import 'package:gtu_app/screens/question_paper_screen.dart';
import 'package:gtu_app/screens/result_screen.dart';
import 'package:gtu_app/screens/syllabus_screen.dart';

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

      case 'Exam Timetable Screen':
        return const ExamTimetableScreen();

      case 'Percentage Calculator Screen':
        return const PercentageCalculatorScreen();

      default:
        return const Center(child: Text('Oops... Something went wrong'));
    }
  }
}
