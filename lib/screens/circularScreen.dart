import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gtu_app/components/CommonTile.dart';
import 'package:gtu_app/components/CustomLoadingIndicator.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/controllers/circularController.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/models/circular_model.dart';
import 'package:gtu_app/style.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({super.key});

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen>
    with TickerProviderStateMixin {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: circular),
          Container(
            child: TabBar(
                controller: tabController,
                labelColor: _colors.primaryColor,
                unselectedLabelColor: _colors.titleColor,
                indicator: MaterialIndicator(
                  color: _colors.primaryColor,
                  topLeftRadius: 5,
                  topRightRadius: 5,
                  bottomLeftRadius: 5,
                  bottomRightRadius: 5,
                  horizontalPadding: 60,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'All Circular',
                      style: _fontStyle.montserrat(15, FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Important',
                      style: _fontStyle.montserrat(15, FontWeight.w500),
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              child: TabBarView(controller: tabController, children: [
                AllCircular(),
                ImportantCircular(),
              ]),
            ),
          ),
        ],
      )),
    );
  }
}

class AllCircular extends StatelessWidget {
  AllCircular({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(AllCircularController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            controller.obx(
              (circularData) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: circularData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return CommonTile(
                      commonCardData:
                          CircularModel.fromJson(circularData[index]),
                    );
                  },
                );
              },
              onLoading: CustomLoadingIndicator(),
            ),
            PoweredbyAstronApps(),
          ],
        ),
      ),
    );
  }
}

class ImportantCircular extends StatelessWidget {
  ImportantCircular({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(ImpCircularController());
  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            controller.obx(
              (circularData) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: circularData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return CommonTile(
                      commonCardData:
                          CircularModel.fromJson(circularData[index]),
                    );
                  },
                );
              },
              onLoading: CustomLoadingIndicator(),
            ),
            PoweredbyAstronApps(),
          ],
        ),
      ),
    );
  }
}
