import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperView extends StatefulWidget {
  const SwiperView({super.key});

  @override
  State<SwiperView> createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  final List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          "https://via.placeholder.com/350x150",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    );
  }
}
