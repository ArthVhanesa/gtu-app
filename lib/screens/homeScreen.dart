import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gtu_app/components/HomeScreenTile.dart';
import 'package:gtu_app/components/KeepItUp.dart';
import 'package:gtu_app/components/RectangleCard.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/components/SquareCard.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/TitleData.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/screens/profileScreen.dart';
import 'package:gtu_app/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  // late ScrollController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = ScrollController();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: padding,
            child: Row(
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  }),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: const AssetImage(profileIconImg),
                    backgroundColor: _colors.blackColor,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: AutoSizeText(
                    "Hello Arth 👋",
                    style: _fontStyle.montserrat(25, FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: padding,
            child: SearchBar(),
          ),
          const SizedBox(
            height: 10,
          ),
          // RectangleCard(card: syllabus),
          // HomeScreenTile(tile: tile[0]),
          // HomeScreenTile(tile: tile[2]),
          SquareCard(card: examTimetable),
          SquareCard(card: studentCorner),
          SquareCard(card: result),
        ],
      )),
    );
  }
}
