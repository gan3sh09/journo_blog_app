part of 'tags_bloc.dart';

abstract class TagsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTagsEvent extends TagsEvent {}
