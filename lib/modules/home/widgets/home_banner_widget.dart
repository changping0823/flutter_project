import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/banner_model.dart';

class HomeBannerWidget extends StatefulWidget {
  final List<BannerModel>? banners;
  const HomeBannerWidget({super.key, this.banners});

  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {

  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: widget.banners?.length,
            itemBuilder: (context, itemIndex, pageIndex) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.banners![itemIndex].imagePath!, fit: BoxFit.cover),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16.0/9, /// 宽高比
              viewportFraction: 1.0,  /// 每个item占满整个viewport
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),  // 播放间隔
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
        ),
        /// 指示器
        Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: Center(
              child: AnimatedSmoothIndicator(
                count: widget.banners!.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: ColorUtil.text_d9,
                  activeDotColor: ColorUtil.main,
                ), activeIndex: _currentIndex,
              ),
            )
        )
      ],
    );
  }
}
