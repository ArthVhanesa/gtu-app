import 'package:flutter/material.dart';
import 'package:gtu_app/components/HomeScreenTile.dart';
import 'package:gtu_app/components/KeepItUp.dart';
import 'package:gtu_app/components/RectangleCard.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/TitleData.dart';
import 'package:gtu_app/image.dart';
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
          child: Padding(
        padding: padding,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: const AssetImage(profileIconImg),
                  backgroundColor: _colors.blackColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text("Hi Arth 👋",
                    style: _fontStyle.montserrat(25, FontWeight.w600))
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            SearchBar(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // ListView.builder(
                    //     itemCount: tile.length,
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemBuilder: (context, index) {
                    //       return RectangleCard(
                    //         card: syllabus,
                    //       );
                    //     }),
                    // HomeScreenTile(tile: tile[0]),
                    // HomeScreenTile(tile: tile[1]),
                    // HomeScreenTile(tile: tile[2]),
                    // ListView(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   children: [
                    //     RectangleCard(card: questionPaper),
                    //     RectangleCard(card: syllabus),
                    //     RectangleCard(card: questionPaper),
                    //     RectangleCard(card: syllabus),
                    //     RectangleCard(card: questionPaper),
                    //     RectangleCard(card: syllabus),
                    //   ],
                    // ),
                    HomeScreenTile(tile: tile[0]),
                    HomeScreenTile(tile: tile[1]),
                    HomeScreenTile(tile: tile[2]),
                    KeepItUp()
                  ],
                ),
              ),
            )
            // Expanded(
            //   child: SingleChildScrollView(
            //     physics: const BouncingScrollPhysics(),
            //     child: Column(
            //       children: [
            //         ListView.separated(
            //           padding: const EdgeInsets.only(top: 30),
            //           itemCount: tile.length,
            //           shrinkWrap: true,
            //           separatorBuilder: (context, index) =>
            //               const SizedBox(height: 60),
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemBuilder: (BuildContext context, int index) {
            //             return HomeScreenTile(
            //               tile: tile[index],
            //             );
            //           },
            //         ),
            //         KeepItUp()
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
