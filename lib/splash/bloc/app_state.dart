part of 'app_cubit.dart';

class AppState extends Equatable {
  final Country? selectedCountry;
  final bool systemDark;
  final bool hasError;
  final List<Article> articleList;
  final String? error;
  final bool isLoading;

  const AppState({
    this.articleList = const [],
    this.hasError = false,
    this.selectedCountry,
    this.systemDark = true,
    this.isLoading = false,
    this.error,
  });

  AppState copyWith({
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
    );
  }

  @override
  List<Object?> get props => [
        articleList,
        hasError,
        systemDark,
        selectedCountry,
        error,
        isLoading,
      ];
}
