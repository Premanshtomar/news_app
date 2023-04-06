import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/values/textstyles.dart';

class HeadlinesScreen extends StatelessWidget {
  static const route = '/headlines';

  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: RichText(
              text: const TextSpan(
                text: 'h',
                style: AppTextStyles.appbarTextFirstStyle,
                children: [
                  TextSpan(
                    text: 'eadlines',
                    style: AppTextStyles.appbarTextSecondStyle,
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showCountryPicker(
                    showSearch: false,
                    useSafeArea: true,
                    context: context,
                    onSelect: (Country country) {
                      print(country.flagEmoji);
                    },
                  );
                },
                icon: Text(
                  state.selectedCountry!.flagEmoji,
                  style: AppTextStyles.flagTextStyle,
                ),
              ),
            ],
          ),
          body: Container(),
        );
      },
    );
  }
}
