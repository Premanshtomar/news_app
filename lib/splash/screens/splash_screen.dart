import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen/home_screen.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appbarRichText(
              'news.',
              size1: 66,
              size2: 44,
              lastColored: true,
            ),
          ],
        ),
      ),
      nextScreen: const Home(),
    );
  }
}
