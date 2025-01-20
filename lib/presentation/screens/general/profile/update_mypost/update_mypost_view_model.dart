part of 'update_mypost_imports.dart';

class UpdateMypostViewModel {
  final Repository repository;
  final quill.QuillController controller;
  UpdateMypostViewModel({
    required this.repository,
    required String body,
  })  : controller = _initializeQuillController(body),
        isEditorEmpty = _initializeIsEditorEmpty(body) {
    controller.addListener(_updateIsEditorEmpty);
  }

  bool isEditorEmpty = true;
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);

  final VelocityBloc<Tag?> selectedTagBloc = VelocityBloc<Tag?>(null);

  final VelocityBloc<Category?> selectedCategoryBloc =
      VelocityBloc<Category?>(null);

  final VelocityBloc<ProfileModel?> profileModelBloc =
      VelocityBloc<ProfileModel?>(null);

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  static quill.QuillController _initializeQuillController(String body) {
    quill.Document document;
    try {
      final decodedJson = jsonDecode(body);
      document = quill.Document.fromJson(decodedJson);
    } catch (e) {
      document = quill.Document()..insert(0, body);
    }
    return quill.QuillController(
      document: document,
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  static bool _initializeIsEditorEmpty(String body) {
    return body.trim().isEmpty;
  }

  void _updateIsEditorEmpty() {
    final isEmpty = controller.document.toPlainText().trim().isEmpty;
    if (isEmpty != isEditorEmpty) {
      isEditorEmpty = isEmpty;
    }
  }

  void dispose() {
    controller.removeListener(_updateIsEditorEmpty);
    controller.dispose();
    textEditingController.dispose();
  }

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        label: AppLocalizations.of(context)!.noImageSelected,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
  }

  updatePost(context, String userId, String postId) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.postsRepo.updatePosts(
      textEditingController.text,
      textEditingController.text.replaceAll(' ', '-'),
      selectedCategoryBloc.state.data!.id.toString(),
      selectedTagBloc.state.data!.id.toString(),
      controller.document.toPlainText(),
      userId,
      selectedImageBloc.state.data!.path,
      selectedImageBloc.state.data!.path.split('/').last.toString(),
      postId,
    );

    if (data.status == 1) {
      isLoadingBloc.onUpdateData(false);
      AutoRouter.of(context).push(GeneralRoute());
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.success,
        // label: data.message.toString(),
        label: AppLocalizations.of(context)!.postUpdatedSuccessfully,

        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
  }

  bool validateTagAndCategory(BuildContext context) {
    if (selectedTagBloc.state.data == null) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        label: AppLocalizations.of(context)!.tagsCannotBeEmpty,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      return false;
    }

    if (selectedCategoryBloc.state.data == null) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        label: AppLocalizations.of(context)!.categoryCannotBeEmpty,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      return false;
    }

    if (selectedImageBloc.state.data == null) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        label: AppLocalizations.of(context)!.imageCannotBeEmpty,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      return false;
    }

    return true;
  }

  deletePost(context, String id, int index) async {
    var data = await repository.postsRepo.deletePosts(id);
    if (data.status == 1) {
      AutoRouter.of(context).push(GeneralRoute());
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.success,
        // label: data.message.toString(),
        label: AppLocalizations.of(context)!.postDeletedSuccessfully,
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      profileModelBloc.state.data?.posts!.removeAt(index);
      profileModelBloc.onUpdateData(profileModelBloc.state.data);
    }
  }
}
