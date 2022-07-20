import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gtu_app/components/HomeScreenTile.dart';
import 'package:gtu_app/components/KeepItUp.dart';
import 'package:gtu_app/components/RectangleCard.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/components/SquareCard.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/CarouselSliderData.dart';
import 'package:gtu_app/data/TitleData.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/screens/profileScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          Padding(
            padding: padding,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                // row for Avatar and hello name
                Row(
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
                        "Hello Arth👋",
                        style: _fontStyle.montserrat(25, FontWeight.w600),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                SearchBar(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  carouselSlider(),
                  Padding(
                    padding: padding,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.separated(
                          itemCount: tile.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 60,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return HomeScreenTile(tile: tile[index]);
                          },
                        ),
                        KeepItUp()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  carouselSlider() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CarouselSlider.builder(
          itemCount: carouselSliderData.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: RectangleCard(card: carouselSliderData[index]));
          },
          options: CarouselOptions(
              height: 140,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              // enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) => setState(
                    (() => activeIndex = index),
                  )),
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: carouselSliderData.length,
          effect: ScrollingDotsEffect(
            spacing: 6,
            radius: 50,
            dotWidth: 6,
            dotHeight: 6,
            activeDotScale: 1.5,
            activeDotColor: _colors.primaryColor,
            // fixedCenter: true,
          ),
        ),
      ],
    );
  }
}
