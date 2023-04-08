part of 'app_cubit.dart';

class AppState extends Equatable {
  final Country? selectedCountry;
  final bool systemDark;
  final bool hasError;
  final List<Article> articleList;
  final String? error;
  final bool isLoading;
  final int page;
  final bool isFetchingOnScroll;

  const AppState({
    this.isFetchingOnScroll = false,
    this.page = 1,
    this.articleList = const [],
    this.hasError = false,
    this.selectedCountry,
    this.systemDark = true,
    this.isLoading = false,
    this.error,
  });

  AppState copyWith({
    bool? isFetchingOnScroll,
    int? page,
    Country? selectedCountry,
    bool? systemDark,
    bool? hasError,
    List<Article>? articleList,
    String? error,
    bool? isLoading,
  }) {
    return AppState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      systemDark: systemDark ?? this.systemDark,
      hasError: hasError ?? this.hasError,
      articleList: articleList ?? this.articleList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      page: page ?? this.page,
      isFetchingOnScroll: isFetchingOnScroll ?? this.isFetchingOnScroll,
    );
  }

  @override
  List<Object?> get props => [
        isFetchingOnScroll,
        page,
        articleList,
        hasError,
        systemDark,
        selectedCountry,
        error,
        isLoading,
      ];
}
