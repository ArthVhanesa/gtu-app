import 'package:flutter/material.dart';
import 'package:gtu_app/components/CommonTile.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/DummyCommonCardData.dart';
import 'package:gtu_app/style.dart';

class StudentCornerScreen extends StatelessWidget {
  const StudentCornerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Header(card: studentCorner),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: dummyCommonCardData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return CommonTile(
                        dummyCommonCardData: dummyCommonCardData[index],
                      );
                    },
                  ),
                  PoweredbyAstronApps()
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
