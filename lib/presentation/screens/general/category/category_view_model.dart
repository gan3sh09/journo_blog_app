part of 'category_imports.dart';

class CategoriesViewModel {
  final Repository repository;
  CategoriesViewModel({required this.repository});

  final VelocityBloc<CategoryModel> categoriesModelBloc =
      VelocityBloc<CategoryModel>(CategoryModel());

  fetchAllCategories() async {
    var categoriesData = await repository.categoryRepo.getAllCategory();
    if (categoriesData.status == 1) {
      categoriesModelBloc.onUpdateData(categoriesData);
    }
  }

  gotoAddCategories(context) async {
    var addedData = await AutoRouter.of(context)
        .push<CategoryModel>(const AddCategoryRoute());
    if (addedData != null) {
      categoriesModelBloc.onUpdateData(addedData);
    }
  }

  gotoUpdateCategories(context, Category categories) async {
    var updateData = await AutoRouter.of(context).push<CategoryModel>(
      UpdateCategoryRoute(
        categoriesData: categories,
      ),
    );
    if (updateData != null) {
      categoriesModelBloc.onUpdateData(updateData);
    }
  }

  deleteCategories(context, String id, int index) async {
    var data = await repository.categoryRepo.deleteCategory(id);
    if (data.status == 1) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.success,
        label: data.message.toString(),
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      categoriesModelBloc.state.data.categories!.removeAt(index);
      categoriesModelBloc.onUpdateData(categoriesModelBloc.state.data);
    }
  }
}
