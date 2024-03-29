import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:gtu_app/components/rectangle_card.dart';
import 'package:gtu_app/data/carousel_slider_data.dart';
import 'package:gtu_app/style/style.dart';

class CarouselSlider1 extends StatefulWidget {
  const CarouselSlider1({super.key});

  @override
  State<CarouselSlider1> createState() => _CarouselSlider1State();
}

class _CarouselSlider1State extends State<CarouselSlider1> {
  @override
  Widget build(BuildContext context) {
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
            activeDotColor: AppColors.primaryColor,
            // fixedCenter: true,
          ),
        ),
      ],
    );
  }
}
