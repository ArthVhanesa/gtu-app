import 'package:gtu_app/data/CardData.dart';

class HomeScreenTileData {
  String title;
  CardData card1;
  CardData card2;
  CardData card3;

  HomeScreenTileData({
    required this.title,
    required this.card1,
    required this.card2,
    required this.card3,
  });
}

List<HomeScreenTileData> tile = [
  HomeScreenTileData(
      title: 'Academics 📚',
      card1: syllabus,
      card2: questionPaper,
      card3: result),
  HomeScreenTileData(
      title: 'Information 📇',
      card1: circular,
      card2: academicCalendar,
      card3: examTimetable),
  HomeScreenTileData(
      title: 'GTU Corner 🎓',
      card1: studentCorner,
      card2: pointActivity,
      card3: studentPortal),
];
