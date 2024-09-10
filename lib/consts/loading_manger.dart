import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingManger extends StatelessWidget {
  const LoadingManger(
      {super.key, required this.isLoading, required this.child});

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitSpinningLines(
      color: Colors.white,
      size: 50.0,
    );
    return Stack(children: [
      child,
      isLoading
          ? Container(
              color: Colors.black54.withOpacity(.5),
            )
          : Container(),
      isLoading ? const Center(child: spinkit) : Container(),
    ]);
  }
}
