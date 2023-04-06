import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()){
    setDefaultCountry();
  }

  void onStart() {
    // Fetching...
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
