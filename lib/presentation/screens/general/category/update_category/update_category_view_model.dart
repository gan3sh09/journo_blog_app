part of 'update_category_import.dart';

class UpdateCategoryViewModel {
  final Repository repository;

  UpdateCategoryViewModel({required this.repository});

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  updateCategories(context, String id) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.categoryRepo.updateCategory(
      id,
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
        // label: data.message.toString(),
        label: AppLocalizations.of(context)!.categoryUpdatedSuccessfully,

        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
  }
}
