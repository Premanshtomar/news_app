import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/headlines/screens/headlines_screen.dart';
import 'package:news_app/home/home_screen/home_screen.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/splash/screens/splash_screen.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/routes.dart';

import 'home/details/detail_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.home: (context) => const Home(),
          AppRoutes.search: (context) => const SearchNews(),
          AppRoutes.details: (context) => const DetailScreen(),
          AppRoutes.headlines: (context) => const HeadlinesScreen(),
        },
        title: 'news.',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.white,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: AppColors.black,
              ),
              color: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColors.transparent,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
