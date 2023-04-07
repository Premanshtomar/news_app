part of 'search_cubit.dart';

class SearchState extends Equatable {
  final SearchEnum searchType;
  final bool isLoading;
  final String textToSearch;
  final List<Article> articleList;
  final bool hasErrorInSearch;

  const SearchState({
    this.hasErrorInSearch = false,
    this.isLoading = false,
    this.articleList = const [],
    this.textToSearch = '',
    this.searchType = SearchEnum.searchInCountry,
  });

  SearchState copyWith({
    bool? hasErrorInSearch,
    bool? isLoading,
    List<Article>? articleList,
    String? textToSearch,
    SearchEnum? searchType,
  }) {
    return SearchState(
      searchType: searchType ?? this.searchType,
      textToSearch: textToSearch ?? this.textToSearch,
      articleList: articleList ?? this.articleList,
      isLoading: isLoading ?? this.isLoading,
      hasErrorInSearch: hasErrorInSearch ?? this.hasErrorInSearch,
    );
  }

  @override
  List<Object?> get props => [
        hasErrorInSearch,
        isLoading,
        articleList,
        textToSearch,
        searchType,
      ];
}
