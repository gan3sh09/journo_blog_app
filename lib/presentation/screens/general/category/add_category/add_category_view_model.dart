part of 'add_category_import.dart';

class AddCategoryViewModel {
  final Repository repository;

  AddCategoryViewModel({required this.repository});

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  addNewCategories(context) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.categoryRepo.addNewCategory(
      textEditingController.text,
      textEditingController.text.toLowerCase().replaceAll(' ', '-'),
    );
    if (data.status == 1) {
      var newData = await repository.categoryRepo.getAllCategory();
      // Navigator.of(context).pop<TagsModel>(newData);

      AutoRouter.of(context).maybePop<CategoryModel>(newData);

      isLoadingBloc.onUpdateData(false);
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
    }
  }
}
