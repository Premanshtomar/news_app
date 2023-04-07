import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/home/repository/article_repository.dart';
import 'package:news_app/network/repo_response.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState()) {
    setDefaultCountry();
    onStart();
  }

  ArticleRepo repo = ArticleRepo();

  // Fetching articles on splash screen
  void onStart() async {
    emit(state.copyWith(isLoading: true));
    RepoResponse<List<Article>> res = await repo.fetchArticle(state.selectedCountry!.countryCode);
    if (res.hasError) {
      // state.error
      // print(res.error);
      emit(
        state.copyWith(hasError: true, isLoading: false),
      );
    } else {
      // emit state list
      emit(
        state.copyWith(
            articleList: res.data, hasError: false, isLoading: false),
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

  void onCountrySelected(Country country){
    emit(state.copyWith(
      selectedCountry: country
    ));
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
