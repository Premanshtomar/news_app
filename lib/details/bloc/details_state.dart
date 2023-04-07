part of 'details_cubit.dart';

class DetailsState extends Equatable {
  final bool isSliverExpanded;

  const DetailsState({
    this.isSliverExpanded = false,
  });

  DetailsState copyWith({
    bool? isSliverExpanded,
  }) {
    return DetailsState(
      isSliverExpanded: isSliverExpanded ?? this.isSliverExpanded,
    );
  }

  @override
  List<Object?> get props => [
    isSliverExpanded,
  ];
}
