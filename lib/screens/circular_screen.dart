import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:gtu_app/components/common_tile.dart';
import 'package:gtu_app/components/custom_loading_indicator.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/controllers/circular_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/models/circular_model.dart';
import 'package:gtu_app/style/style.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({super.key});

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: circular),
          Container(
            child: TabBar(
                controller: tabController,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.titleColor,
                indicator: MaterialIndicator(
                  color: AppColors.primaryColor,
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
                      style: FontStyle.montserrat(15, FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Important',
                      style: FontStyle.montserrat(15, FontWeight.w500),
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
