part of 'tags_bloc.dart';

abstract class TagsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TagsInitial extends TagsState {}

class TagsLoading extends TagsState {}

class TagsLoaded extends TagsState {
  final List<Tag> tags;

  TagsLoaded(this.tags);

  @override
  List<Object?> get props => [tags];
}

class TagsError extends TagsState {
  final String errorMessage;

  TagsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
