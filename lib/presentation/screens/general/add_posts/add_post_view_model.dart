part of 'add_post_imports.dart';

class AddPostViewModel {
  final Repository repository;
  AddPostViewModel({required this.repository});

  final QuillController controller = QuillController.basic();
  bool isEditorEmpty = true;
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

   final FocusNode focusNode = FocusNode();

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);

  final VelocityBloc<Tag?> selectedTagBloc = VelocityBloc<Tag?>(null);

  final VelocityBloc<Category?> selectedCategoryBloc =
      VelocityBloc<Category?>(null);

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        label: 'No Image Selected',
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
  }

  addNewPost(context, String userId) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.postsRepo.addNewPosts(
      textEditingController.text,
      textEditingController.text.replaceAll(' ', '-'),
      selectedCategoryBloc.state.data!.id.toString(),
      selectedTagBloc.state.data!.id.toString(),
      controller.document.toPlainText(),
      userId,
      selectedImageBloc.state.data!.path,
      selectedImageBloc.state.data!.path.split('/').last.toString(),
    );
    // log(selectedImageBloc.state.data!.path.split('/').last.toString());

    if (data.status == 1) {
      clear();
      isLoadingBloc.onUpdateData(false);
      AutoRouter.of(context).push(GeneralRoute());
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

  clear() {
    selectedImageBloc.onUpdateData(null);
    textEditingController.clear();
    selectedTagBloc.onUpdateData(null);
    selectedCategoryBloc.onUpdateData(null);
    controller.clear();
  }
}
