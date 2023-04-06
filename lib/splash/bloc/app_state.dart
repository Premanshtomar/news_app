part of 'app_cubit.dart';

class AppState extends Equatable {
  final Country? selectedCountry;
  final bool systemDark;

  const AppState({
    this.selectedCountry,
    this.systemDark = true,
  });

  AppState copyWith({
    Country? selectedCountry,
    bool? systemDark,
  }) {
    return AppState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      systemDark: systemDark ?? this.systemDark,
    );
  }

  @override
  List<Object?> get props => [
        systemDark,
        selectedCountry,
      ];
}
