import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/consts.dart';

class LogInSwiper extends StatelessWidget {
  const LogInSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplayDisableOnInteraction: true,
      duration: 1000,
      autoplayDelay: 6000,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(Constss.loginImages[index], fit: BoxFit.cover);
      },
      autoplay: true,
      itemCount: Constss.loginImages.length,
    );
  }
}
