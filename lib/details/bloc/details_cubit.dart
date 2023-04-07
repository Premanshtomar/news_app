import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(const DetailsState());

  void checkIfCompact(BoxConstraints constraints, double height) {
    var isExpanded = constraints.maxHeight > height * 0.14;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isExpanded) {
        emit(state.copyWith(isSliverExpanded: true));
      } else {
        emit(state.copyWith(isSliverExpanded: false));
      }
    });
  }
}
