import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/home_screen/home_screen.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/values/app_images.dart';
import 'package:news_app/values/routes.dart';
import 'package:news_app/values/text_styles.dart';
import 'package:news_app/widgets/home_page_card.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class HeadlinesScreen extends StatelessWidget {
  static const route = '/headlines';

  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: appbarRichText('headlines'),
            actions: [
              IconButton(
                onPressed: () {
                  showCountryPicker(
                    showSearch: false,
                    useSafeArea: true,
                    context: context,
                    onSelect: (Country country) {},
                  );
                },
                icon: Text(
                  state.selectedCountry!.flagEmoji,
                  style: AppTextStyles.flagTextStyle,
                ),
              ),
            ],
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
