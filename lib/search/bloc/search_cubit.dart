import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/network/repo_response.dart';
import 'package:news_app/search/repository/search_article_repo.dart';
import 'package:news_app/utils/enums/search_enums.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState()) {
    articleScrollController.addListener(handleParticipantScroll);
  }

  final ScrollController articleScrollController = ScrollController();

  void handleParticipantScroll() {
    if (articleScrollController.position.extentAfter < 150 &&
        !state.isFetchingOnScrolling) {
      if (state.page < 100) {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        searchArticles(state.searchQuery, state.page + 1, true);
      }
    }
  }

  void setSearchType(SearchEnum type) {
    emit(
      state.copyWith(searchType: type),
    );
  }

  void clearSearchQueryText() {
    emit(state.copyWith(
      searchQuery: '',
      articleList: <Article>[],
    ));
  }

  SearchArticle searchRepo = SearchArticle();

  Future<void> searchArticles(String text, [page = 1, fromScroll = false]) async {
    emit(state.copyWith(
      isFetchingOnScrolling: fromScroll,
      isLoading: !fromScroll,
      searchQuery: text,
    ));
    if (text.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(
        state.copyWith(
          articleList: const [],
          isLoading: false,
        ),
      );
      return;
    }
    RepoResponse<List<Article>> result =
        await searchRepo.fetchArticle(text: text, page: page);
    if (result.hasError && result.data == null) {
      // state.error
      // print(result.error);
      emit(
        state.copyWith(
          hasErrorInSearch: true,
          isLoading: false,
          isFetchingOnScrolling: false,
        ),
      );
    } else {
      // copying old articles, adding new to update, for pagination todo
      var updatedArticles = <Article>[];
      if (fromScroll) {
        updatedArticles = [...state.articleList];
        if (result.data!.isNotEmpty) {
          updatedArticles.addAll(result.data!);
        }
      } else {
        updatedArticles = result.data!;
      }
      emit(
        state.copyWith(
          articleList: updatedArticles,
          hasErrorInSearch: false,
          isLoading: false,
          isFetchingOnScrolling: false,
          page: page,
        ),
      );
    }
  }
}
