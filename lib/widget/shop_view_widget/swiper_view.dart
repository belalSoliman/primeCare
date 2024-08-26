import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperView extends StatefulWidget {
  const SwiperView({super.key});

  @override
  State<SwiperView> createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  final List<String> images = [
    'assets/category_assets/cat-2.png',
    "assets/category_assets/cat-4.png",
    "assets/category_assets/cat-6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(images[index], fit: BoxFit.contain);
        },
        autoplay: true,
        itemCount: images.length,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeSize: 10.0,
            space: 5.0,
            size: 10.0,
            activeColor: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}
