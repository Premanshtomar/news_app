import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/network/repo_response.dart';
import 'package:news_app/search/repository/search_article_repo.dart';
import 'package:news_app/utils/enums/search_enums.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void setSearchType(SearchEnum type) {
    emit(
      state.copyWith(searchType: type),
    );
  }

  SearchArticleInCountryRepo inCountryRepo = SearchArticleInCountryRepo();
  SearchArticleInEveryThingRepo inEveryThingRepo =
      SearchArticleInEveryThingRepo();

  void onTypeToSearchInCountry(Country selectedCountry, String text) async {
    emit(state.copyWith(isLoading: true));
    RepoResponse<List<Article>> result =
        await inCountryRepo.fetchArticle(selectedCountry.countryCode, text);
    if (result.hasError) {
      // state.error
      // print(result.error);
      emit(
        state.copyWith(
          hasErrorInSearch: true,
          isLoading: false,
        ),
      );
    } else {
      // emit state list
      emit(
        state.copyWith(
          articleList: result.data,
          hasErrorInSearch: false,
          isLoading: false,
        ),
      );
    }
  }

  void onTypeToSearchInEverThing(String text) async {
    emit(state.copyWith(isLoading: true));
    RepoResponse<List<Article>> result =
        await inEveryThingRepo.fetchArticle(text);
    if (result.hasError) {
      // state.error
      // print(result.error);
      emit(
        state.copyWith(
          hasErrorInSearch: true,
          isLoading: false,
        ),
      );
    } else {
      // emit state list
      emit(
        state.copyWith(
          articleList: result.data,
          hasErrorInSearch: false,
          isLoading: false,
        ),
      );
    }
  }
}
