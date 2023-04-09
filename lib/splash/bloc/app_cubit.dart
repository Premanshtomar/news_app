import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/home/repository/article_repository.dart';
import 'package:news_app/network/repo_response.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState()) {
    setDefaultCountry();
    onStart();
    homePageScrollController.addListener(handleHomeScroll);
  }

  ArticleRepo repo = ArticleRepo();
  final ScrollController homePageScrollController = ScrollController();

  void handleHomeScroll() {
    if (homePageScrollController.position.extentAfter < 150 &&
        !state.isFetchingOnScroll) {
      if (state.page < 100) {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        onStart(state.page + 1, true);
      }
    }
  }

  // Fetching articles on splash screen
  void onStart([int page = 1, bool fromScroll = false]) async {
    emit(
      state.copyWith(
        isFetchingOnScroll: fromScroll,
        isLoading: !fromScroll,
      ),
    );
    RepoResponse<List<Article>> res = await repo.fetchArticle(
      state.selectedCountry!.countryCode,
      page,
    );
    if (res.hasError && res.data == null) {
      emit(
        state.copyWith(
          error: res.error,
          hasError: true,
          isLoading: false,
          isFetchingOnScroll: false,
        ),
      );
    } else {
      var updatedArticleList = <Article>[];
      if (fromScroll) {
        updatedArticleList = [...state.articleList];
        if (res.data!.isNotEmpty) {
          updatedArticleList.addAll(res.data!);
        }
      } else {
        updatedArticleList = res.data ?? [];
      }
      // emit state list
      emit(
        state.copyWith(
            articleList: updatedArticleList,
            hasError: false,
            isLoading: false,
            isFetchingOnScroll: false,
            page: page),
      );
    }
  }

  void onSliverScrolledUp() {
    emit(state.copyWith(
      systemDark: false,
    ));
  }

  void onSliverScrolledDown() {
    emit(state.copyWith(
      systemDark: true,
    ));
  }

  void onCountrySelected(Country country) {
    emit(state.copyWith(selectedCountry: country));
    onStart();
  }

  void setDefaultCountry({String? country}) {
    Country c = Country.parse(country ?? 'india');
    emit(
      state.copyWith(
        selectedCountry: c,
      ),
    );
  }
}
