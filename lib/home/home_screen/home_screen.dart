import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/values/app_icons.dart';
import 'package:news_app/values/app_images.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/routes.dart';
import 'package:news_app/values/text_styles.dart';
import 'package:news_app/widgets/home_page_card.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return Scaffold(
          appBar: AppBar(
            title: appbarRichText('news'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.info);
                },
                icon: const Icon(AppIcons.icInfo),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.search);
                },
                icon: const Icon(AppIcons.icSearch),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text(
              'Headlines',
              style: AppTextStyles.bodyTextBlackBold,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.headlines);
            },
            backgroundColor: AppColors.amberAccent,
          ),
          body: ListView.builder(
            itemCount: 15,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return InkWell(
                child: NewsViewCard(
                  details: index.isEven ? h1 : h2,
                  thumbnailUrl: AppNetworkImages.newsImage,
                  headline: index.isEven ? h2 : h1,
                  source: 'youtube',
                ),
                onTap: () async {
                  Navigator.pushNamed(context, AppRoutes.details);
                },
              );
            },
          ),
        );
      },
    );
  }
}

// todo, to be removed later
String h1 =
    'Top Iranian, Saudi envoys meet in China, discuss diplomatic ties - Reuters';
String h2 = 'The foreign ministers of Iran and Saudi Arabia met in Beijing on '
    'Thursday for the first formal gathering of their top diplomats in more than '
    'seven years, after China brokered a deal to restore relations between the '
    'top regional powers.';
