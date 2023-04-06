part of 'app_cubit.dart';

class AppState extends Equatable {
  final Country? selectedCountry;

   AppState({
    this.selectedCountry,

  });

  AppState copyWith({
    Country? selectedCountry,
  }) {
    return AppState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }


  @override
  List<Object?> get props => [
        selectedCountry,
      ];
}
