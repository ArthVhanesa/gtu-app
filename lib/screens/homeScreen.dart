import 'package:flutter/material.dart';
import 'package:gtu_app/components/BoxComponent.dart';
import 'package:gtu_app/components/KeepItUp.dart';
import 'package:gtu_app/components/SearchBar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: tile.length + 1,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return tile.length != index
                      ? BoxComponent(
                          tileData: tile[index],
                        )
                      : KeepItUp();
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
