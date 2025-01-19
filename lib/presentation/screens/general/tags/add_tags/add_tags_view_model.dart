part of 'add_tags_import.dart';

class AddTagsViewModel {
  final Repository repository;

  AddTagsViewModel({required this.repository});

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  addNewTags(context) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.tagsRepo.addNewTags(
      textEditingController.text,
      textEditingController.text.toLowerCase().replaceAll(' ', '-'),
    );
    if (data.status == 1) {
      var newData = await repository.tagsRepo.getAllTags();
      // Navigator.of(context).pop<TagsModel>(newData);

      AutoRouter.of(context).maybePop(newData);

      isLoadingBloc.onUpdateData(false);
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.success,
        // label: data.message.toString(),
        label: AppLocalizations.of(context)!.tagAddedSuccessfully,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
  }
}
