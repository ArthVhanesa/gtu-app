import 'package:flutter/material.dart';

class MenuItemData {
  final String title;
  final IconData icon;
  final String url;
  const MenuItemData({
    required this.title,
    required this.icon,
    required this.url,
  });
}

// 100 point activiy
// student portal
// de project
// result
// grade history
// mid marks

class MenuItems {
  static const result = MenuItemData(
    title: 'Result',
    icon: Icons.percent_outlined,
    url: "https://www.gturesults.in",
  );
  static const gradeHistory = MenuItemData(
    title: 'Grade History',
    icon: Icons.timeline,
    url: "https://www.students.gtu.ac.in",
  );
  static const midMarks = MenuItemData(
    title: 'Mid marks',
    icon: Icons.done_all,
    url: "https://www.me.gtu.ac.in/student/studentmarkdisplay.aspx",
  );
  static const dePortal = MenuItemData(
    title: 'DE Portal',
    icon: Icons
        .precision_manufacturing_outlined, // precision_manufacturing_outlined
    url: "https://de.gtu.ac.in/Account/Login",
  );
  static const studentPortal = MenuItemData(
    title: 'Student Portal',
    icon: Icons.person_outline,
    url: "https://student.gtu.ac.in/Login.aspx",
  );
  static const hundredPointActivity = MenuItemData(
    title: '100 Point Activity',
    icon: Icons.rocket_launch_outlined, // scoreboard_outlined
    url: "https://www.100points.gtu.ac.in/",
  );

  static const all = <MenuItemData>[
    result,
    gradeHistory,
    midMarks,
    dePortal,
    hundredPointActivity,
    studentPortal,
  ];
}
