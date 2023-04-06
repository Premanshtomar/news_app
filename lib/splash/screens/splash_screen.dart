import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/home/home_screen/home_screen.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/values/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return AnimatedSplashScreen(
          // function: cubit.setDefaultCountry,
          duration: 2000,
          splash: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(children: [
              RichText(
                text: TextSpan(
                  text: 'n',
                  style: AppTextStyles.appbarTextFirstStyle.copyWith(
                    fontSize: 66,
                    letterSpacing: 3

                  ),
                  children: [
                    TextSpan(
                      text: 'ews.',
                      style: AppTextStyles.appbarTextSecondStyle.copyWith(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              const SpinKitFoldingCube(
                color: Colors.amberAccent,
              )
            ]),
          ),
          nextScreen: const Home(),
        );
      },
    );
  }
}
