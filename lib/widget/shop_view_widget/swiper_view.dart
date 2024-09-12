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
    'assets/category_assets/cat-4.png',
    'assets/category_assets/cat-6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              images[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          autoplayDelay: 3000, // Adjust the autoplay delay
          itemCount: images.length,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeSize: 10.0,
              space: 2.0,
              size: 6.0,
              activeColor: Colors.lightBlue,
            ),
          ),
          control: const SwiperControl(
            color: Colors.white,
            size: 20.0,
            padding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}
