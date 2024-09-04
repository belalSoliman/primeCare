import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharnacy_trust/consts/consts.dart';

class EmptyNotificationsScreen extends StatelessWidget {
  const EmptyNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Determine if the screen is in portrait or landscape mode
          bool isPortrait = constraints.maxHeight > constraints.maxWidth;
          isPortrait = true;

          return Padding(
            padding: EdgeInsets.all(isPortrait ? 16 : 24),
            child: Column(
              children: [
                const Spacer(flex: 2),
                SizedBox(
                  width: constraints.maxWidth * 0.8,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.string(
                      Constss.noNotificationIllistration,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                const ErrorInfo(
                  title: "No Items Available",
                  description:
                      "This category is currently empty. Please check back later or explore other categories.",
                  btnText: "Browse Categories",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = 1.0;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)
                  .copyWith(fontSize: 24 * textScaleFactor),
            ),
            SizedBox(height: 16 * textScaleFactor),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16 * textScaleFactor),
            ),
            SizedBox(height: 16 * 2.5 * textScaleFactor),
            button ??
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48 * textScaleFactor),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child: Text(
                    btnText?.toUpperCase() ?? "Retry".toUpperCase(),
                    style: TextStyle(fontSize: 16 * textScaleFactor),
                  ),
                ),
            SizedBox(height: 16 * textScaleFactor),
          ],
        ),
      ),
    );
  }
}
