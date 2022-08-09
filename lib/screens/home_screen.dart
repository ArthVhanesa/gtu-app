import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/carousel_home.dart';
import 'package:gtu_app/components/home_screen_tile.dart';
import 'package:gtu_app/components/keep_it_up.dart';
import 'package:gtu_app/components/searchbar.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/data/title_data.dart';
import 'package:gtu_app/screens/profile_screen.dart';
import 'package:gtu_app/screens/search_result_screen.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FontStyle _fontStyle = FontStyle();

  final signinController = Get.put(SignInController());
  final textController = Get.put(TextEditingController());

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
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          ZoomDrawer.of(context)!.toggle();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: SvgPicture.asset(
                          hamburger,
                          height: 35,
                          width: 35,
                          color: AppColors.blackColor,
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
                        backgroundColor: AppColors.blackColor,
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
                    searchInputController: textController,
                    onTap: () {
                      Get.to(
                          SearchResultScreen(searchInput: textController.text));
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onSubmitted: (text) {
                      Get.to(SearchResultScreen(searchInput: text));
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
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
                    const CarouselSlider1(),
                    Padding(
                      padding: padding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ListView.separated(
                            itemCount: tile.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) {
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
        ),
      ),
    );
  }
}
