part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCategoryEvent extends CategoryEvent {}
