part of 'search_cubit.dart';

class SearchState extends Equatable {
  final SearchEnum searchType;
  final bool isLoading;
  final bool isFetchingOnScrolling;
  final String textToSearch;
  final List<Article> articleList;
  final bool hasErrorInSearch;
  final int page;
  final String searchQuery;

  const SearchState({
    this.hasErrorInSearch = false,
    this.isLoading = false,
    this.articleList = const [],
    this.textToSearch = '',
    this.isFetchingOnScrolling = false,
    this.searchType = SearchEnum.searchInPage,
    this.page = 1,
    this.searchQuery = '',
  });

  SearchState copyWith({
    bool? hasErrorInSearch,
    bool? isLoading,
    List<Article>? articleList,
    String? textToSearch,
    SearchEnum? searchType,
    int? page,
    String? searchQuery,
    bool? isFetchingOnScrolling,
  }) {
    return SearchState(
      searchType: searchType ?? this.searchType,
      textToSearch: textToSearch ?? this.textToSearch,
      articleList: articleList ?? this.articleList,
      isLoading: isLoading ?? this.isLoading,
      hasErrorInSearch: hasErrorInSearch ?? this.hasErrorInSearch,
      page: page ?? this.page,
      searchQuery: searchQuery ?? this.searchQuery,
      isFetchingOnScrolling:
          isFetchingOnScrolling ?? this.isFetchingOnScrolling,
    );
  }

  @override
  List<Object?> get props => [
        hasErrorInSearch,
        isLoading,
        articleList,
        textToSearch,
        searchType,
        page,
        searchQuery,
        isFetchingOnScrolling,
      ];
}
