import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'headlines_state.dart';

class HeadlinesCubit extends Cubit<HeadlinesState> {
  HeadlinesCubit() : super(HeadlinesInitial());
}
