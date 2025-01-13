part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;

  CategoryLoaded(this.category);

  @override
  List<Object?> get props => [category];
}

class CategoryError extends CategoryState {
  final String errorMessage;

  CategoryError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
