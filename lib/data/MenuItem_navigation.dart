// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ============================================================================//
// this is unused drawer screen with navigaion to other screens
// whenever want to navigate to other screen from the drawe use this file
// ============================================================================//

class MenuItemData {
  final String title;
  final IconData icon;
  const MenuItemData({
    required this.title,
    required this.icon,
  });
}

//syllabus
//question paper
//result
//percentage calc
//circular
//Exam timetable
//student portal
class MenuItems {
  static const Home = MenuItemData(
    title: 'Home',
    icon: Icons.home,
  );
  static const syllabus = MenuItemData(
    title: 'Syllabus',
    icon: Icons.folder_open_outlined,
  );
  static const questionPaper = MenuItemData(
    title: 'Question Paper',
    icon: Icons.description_outlined,
  );
  static const result = MenuItemData(
    title: 'Result',
    icon: Icons.done_all,
  );
  static const percentageCalculator = MenuItemData(
    title: 'Percentage Calculator',
    icon: Icons.calculate_outlined,
  );
  static const circular = MenuItemData(
    title: 'Circular',
    icon: Icons.update_outlined,
  );
  static const examTimetable = MenuItemData(
    title: 'Exam Timetable',
    icon: Icons.calendar_month_outlined,
  );

  static const all = <MenuItemData>[
    syllabus,
    questionPaper,
    result,
    percentageCalculator,
    circular,
    examTimetable,
  ];
}
