import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/consts.dart';

class LogInSwiper extends StatelessWidget {
  const LogInSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(Constss.loginImages[index], fit: BoxFit.contain);
      },
      autoplay: true,
      itemCount: Constss.loginImages.length,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeSize: 10.0,
          space: 2.0,
          size: 5.0,
          activeColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
