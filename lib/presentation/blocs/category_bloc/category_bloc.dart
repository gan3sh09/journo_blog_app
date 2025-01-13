import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:journo_blog_app/data/repositories/category_repo.dart';
import '../../screens/general/category/category_model.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryBloc(this.categoryRepo) : super(CategoryInitial()) {
    on<FetchCategoryEvent>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categoryModel = await categoryRepo.getAllCategory();
        emit(CategoryLoaded(categoryModel.categories ?? []));
      } catch (e) {
        emit(CategoryError('Failed to fetch tags: $e'));
      }
    });
  }
}
