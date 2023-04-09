import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/search/bloc/search_cubit.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/enums/search_enums.dart';
import 'package:news_app/values/app_icons.dart';
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
        // if (state.hasError) {
        //   showErrorDialog(context, 'Something Went Wrong');
        // }

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
              // search in entire news portal
              IconButton(
                onPressed: () {
                  var searchCubit = context.read<SearchCubit>();
                  searchCubit.clearSearchQueryText();
                  searchCubit.searchTextController.clear();
                  Navigator.pushNamed(
                    context,
                    AppRoutes.search,
                    arguments: SearchEnum.searchInNews,
                  );
                },
                icon: const Icon(AppIcons.icSearch),
              ),
              IconButton(
                onPressed: () {
                  showCountryPicker(
                    countryFilter: countryListToShow,
                    showSearch: false,
                    useSafeArea: false,
                    context: context,
                    onSelect: (Country country) {
                      cubit.onCountrySelected(country);
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<SearchCubit>().searchTextController.clear();
              if (state.articleList.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Nothing to find in page'),
                  ),
                );
              } else {
                context
                    .read<SearchCubit>()
                    .setPreviousPageList(state.articleList);
                Navigator.pushNamed(
                  context,
                  AppRoutes.search,
                  arguments: SearchEnum.searchInPage,
                );
              }
            },
            backgroundColor: AppColors.amberAccent,
            child: const Icon(
              AppIcons.icSearch2,
              color: AppColors.black,
            ),
          ),
          body: state.isLoading
              ? const Center(
                  child: SpinKitFoldingCube(
                    color: Colors.amberAccent,
                  ),
                )
              : state.hasError
                  ? Center(
                      child: Text(
                        state.error!,
                        style: AppTextStyles.bodyText18BlackBold,
                      ),
                    )
                  : state.articleList.isEmpty
                      ? const Center(
                          child: Text(
                            'List is Empty',
                            style: AppTextStyles.bodyText18BlackBold,
                          ),
                        )
                      : ListView.builder(
                          controller: cubit.homePageScrollController,
                          itemCount: state.articleList.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            Article article = state.articleList[index];
                            return NewsViewCard(
                              article: article,
                            );
                          },
                        ),
        );
      },
    );
  }
}
