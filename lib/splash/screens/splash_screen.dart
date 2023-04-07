import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/home/home_screen/home_screen.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return AnimatedSplashScreen(
          // function: cubit.setDefaultCountry,
          duration: 200000,
          splash: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                appbarRichText(
                  'news.',
                  size1: 66,
                  size2: 44,
                  lastColored: true,
                ),
                const SizedBox(width: 32),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: SpinKitFoldingCube(
                    color: Colors.amberAccent,
                  ),
                )
              ],
            ),
          ),
          nextScreen: const Home(),
        );
      },
    );
  }
}
