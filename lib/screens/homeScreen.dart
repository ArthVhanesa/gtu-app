import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gtu_app/components/HomeScreenTile.dart';
import 'package:gtu_app/components/KeepItUp.dart';
import 'package:gtu_app/components/RectangleCard.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/controllers/signInController.dart';
import 'package:gtu_app/data/CarouselSliderData.dart';
import 'package:gtu_app/data/TitleData.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/main.dart';
import 'package:gtu_app/screens/profileScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: padding,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                // row for Avatar, hamburger and 'hi, name'
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ZoomDrawer.of(context)!.toggle();
                        FocusScope.of(context).unfocus();
                      },
                      child: SvgPicture.asset(
                        hamburger,
                        height: 35,
                        width: 35,
                        color: _colors.blackColor,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: signinController.obx((data) => AutoSizeText(
                            "Hi, ${data.firstName ?? ""}👋",
                            style: _fontStyle.montserrat(25, FontWeight.w600),
                            maxLines: 1,
                          )),
                    ),
                    CircleAvatar(
                      radius: 23,
                      backgroundImage: const AssetImage(profileIconImg),
                      backgroundColor: _colors.blackColor,
                      child: Material(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(const ProfileScreen());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                SearchBar(
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                        KeepItUp(),
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
