import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/search/bloc/search_cubit.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/utils/enums/search_enums.dart';
import 'package:news_app/values/app_icons.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/text_styles.dart';
import 'package:news_app/widgets/search_page_card.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchEnum searchType =
        ModalRoute.of(context)?.settings.arguments as SearchEnum;
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var cubit = context.read<SearchCubit>();
          var appCubit = context.read<AppCubit>();
          cubit.setSearchType(searchType);
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: SizedBox(
                  height: kToolbarHeight - 10,
                  child: TextField(
                    onChanged: (val) {
                      if (searchType == SearchEnum.searchInCountry) {
                        cubit.onTypeToSearchInCountry(
                            appCubit.state.selectedCountry!, val);
                      } else {
                        cubit.onTypeToSearchInEverThing(val);
                      }
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.amber),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          AppIcons.icSearch,
                          color: AppColors.black,
                        ),
                      ),
                      // border: InputBorder.none,
                      hintText: 'Type to Search...',
                    ),
                  ),
                ),
              ),
            ),
            body: state.isLoading
                ? const Center(
                    child: SpinKitFoldingCube(
                      color: Colors.amberAccent,
                    ),
                  )
                : state.hasErrorInSearch
                    ? const Center(
                        child: Text(
                          'Something went Wrong!!',
                          style: AppTextStyles.bodyText18BlackBold,
                        ),
                      )
                    : state.articleList.isEmpty
                        ? const Center(
                            child: Text(
                              'List is Empty!!',
                              style: AppTextStyles.bodyText18BlackBold,
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.articleList.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              Article article = state.articleList[index];
                              return SearchNewsCard(
                                article: article,
                              );
                            },
                          ),
          );
        },
      ),
    );
  }
}