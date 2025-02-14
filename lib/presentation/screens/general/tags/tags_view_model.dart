part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;
  TagsViewModel({required this.repository});

  final VelocityBloc<TagsModel> tagsModelBloc =
      VelocityBloc<TagsModel>(TagsModel());

  fetchAllTags() async {
    var tagsData = await repository.tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      tagsModelBloc.onUpdateData(tagsData);
    }
  }

  gotoAddTags(context) async {
    var addedData =
        await AutoRouter.of(context).push<TagsModel>(const AddTagsRoute());
    if (addedData != null) {
      tagsModelBloc.onUpdateData(addedData);
    }
  }

  gotoUpdateTags(context, Tag tag) async {
    var updateData = await AutoRouter.of(context).push<TagsModel>(
      UpdateTagsRoute(
        tagsData: tag,
      ),
    );
    if (updateData != null) {
      tagsModelBloc.onUpdateData(updateData);
    }
  }

  deleteTags(context, String id, int index) async {
    var data = await repository.tagsRepo.deleteTags(id);
    if (data.status == 1) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.success,
        // label: data.message.toString(),
        label: AppLocalizations.of(context)!.tagDeletedSuccessfully,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      tagsModelBloc.state.data.tags!.removeAt(index);
      tagsModelBloc.onUpdateData(tagsModelBloc.state.data);
    }
  }
}
