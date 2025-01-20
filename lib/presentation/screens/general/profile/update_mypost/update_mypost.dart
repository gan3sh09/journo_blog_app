part of 'update_mypost_imports.dart';

@RoutePage()
class UpdateMypost extends StatefulWidget {
  final UserDetails userData;
  final Post userPostsData;
  final int index;

  const UpdateMypost(
      {required this.userData,
      required this.userPostsData,
      required this.index,
      super.key});

  @override
  State<UpdateMypost> createState() => _UpdateMypostState();
}

class _UpdateMypostState extends State<UpdateMypost> {
  late UpdateMypostViewModel updateMypostViewModel;

  @override
  void initState() {
    super.initState();
    updateMypostViewModel = UpdateMypostViewModel(
        repository: context.read<Repository>(),
        body: widget.userPostsData.body.toString());

    updateMypostViewModel.textEditingController.text =
        widget.userPostsData.title.toString();

    updateMypostViewModel.controller.addListener(() {
      final isEmpty = updateMypostViewModel.controller.document
          .toPlainText()
          .trim()
          .isEmpty;
      if (isEmpty != updateMypostViewModel.isEditorEmpty) {
        if (mounted) {
          setState(() {
            updateMypostViewModel.isEditorEmpty = isEmpty;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    updateMypostViewModel.textEditingController.dispose();
    updateMypostViewModel.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context)!.updatePost,
            ),
            leading: AutoLeadingButton(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: IconButton(
                  onPressed: () => _showMorePopupMenu(context, widget.index),
                  icon: Icon(
                    HugeIcons.strokeRoundedMoreVertical,
                    size: 28.h,
                  ),
                ),
              )
            ],
          ),
          body: Form(
            key: updateMypostViewModel.formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              children: [
                BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
                  bloc: updateMypostViewModel.selectedImageBloc,
                  builder: (context, state) {
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: state.data != null
                              ? Image.file(
                                  File(state.data!.path),
                                  height: SizeConfig.screenHeight * 0.25,
                                  width: SizeConfig.screenWidth,
                                  fit: BoxFit.cover,
                                )
                              : CustomCachedImage(
                                  photoUrl:
                                      'https://techblog.codersangam.com/${widget.userPostsData.featuredimage.toString().replaceAll('public', 'storage')}',
                                  height: SizeConfig.screenHeight * 0.25,
                                  width: SizeConfig.screenWidth,
                                ),
                        ),
                        Positioned(
                          right: 10.w,
                          bottom: 10.h,
                          child: IconButton(
                            onPressed: () =>
                                updateMypostViewModel.pickImage(context),
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              color: AppColors.primaryColor,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                20.heightBox,
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.heightBox,
                CustomTextFormField(
                  controller: updateMypostViewModel.textEditingController,
                  keyboardType: TextInputType.text,
                  validator: (title) {
                    if (title == null || title.isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterATitle;
                    }
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.title,
                  fillColor: AppColors.whiteColor,
                ),
                20.heightBox,
                Text(
                  AppLocalizations.of(context)!.slug,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.heightBox,
                CustomTextFormField(
                  controller: updateMypostViewModel.textEditingController,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  validator: (slug) {
                    if (slug == null || slug.isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterASlug;
                    }
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.slug,
                  fillColor: AppColors.whiteColor,
                ),
                20.heightBox,
                Text(
                  AppLocalizations.of(context)!.tags,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.heightBox,
                //  Tag Section
                BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
                  bloc: updateMypostViewModel.selectedTagBloc,
                  builder: (context, state) {
                    return InkWell(
                      onTap: () async {
                        var data = await AutoRouter.of(context).push<Tag>(
                            TagsRoute(navigateType: NavigateType.inner));
                        // log(data!.title.toString());
                        updateMypostViewModel.selectedTagBloc
                            .onUpdateData(data);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.data != null
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Text(
                                      state.data!.title.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  )
                                : Text(
                                    AppLocalizations.of(context)!.tags,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                20.heightBox,
                // Category section
                Text(
                  AppLocalizations.of(context)!.category,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.heightBox,
                BlocBuilder<VelocityBloc<Category?>, VelocityState<Category?>>(
                  bloc: updateMypostViewModel.selectedCategoryBloc,
                  builder: (context, state) {
                    return InkWell(
                      onTap: () async {
                        var data = await AutoRouter.of(context).push<Category>(
                            CategoriesRoute(navigateType: NavigateType.inner));
                        // log(data!.title.toString());
                        updateMypostViewModel.selectedCategoryBloc
                            .onUpdateData(data);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.data != null
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Text(
                                      state.data!.title.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  )
                                : Text(
                                    AppLocalizations.of(context)!.category,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                20.heightBox,
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                3.heightBox,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyColor,
                    ),
                  ),
                  child: QuillSimpleToolbar(
                    controller: updateMypostViewModel.controller,
                    configurations: const QuillSimpleToolbarConfigurations(),
                  ),
                ),
                20.heightBox,
                Container(
                  padding: EdgeInsets.all(20),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: QuillEditor.basic(
                    controller: updateMypostViewModel.controller,
                  ),
                ),
                20.heightBox,
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: updateMypostViewModel.isLoadingBloc,
                  builder: (context, state) {
                    return PrimaryButton(
                      isLoading: state.data,
                      title: AppLocalizations.of(context)!.updatePost,
                      onPressed: () {
                        if (!updateMypostViewModel.formKey.currentState!
                            .validate()) {
                          IconSnackBar.show(
                            context,
                            snackBarType: SnackBarType.alert,
                            label: AppLocalizations.of(context)!
                                .postFieldCannotBeEmpty,
                            labelTextStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          );
                        } else if (!updateMypostViewModel
                            .validateTagAndCategory(context)) {
                          return;
                        } else {
                          updateMypostViewModel.updatePost(
                            context,
                            context
                                .read<VelocityBloc<ProfileModel>>()
                                .state
                                .data
                                .userDetails!
                                .id
                                .toString(),
                            widget.userPostsData.id.toString(),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }

  void _showMorePopupMenu(BuildContext context, index) {
    showMenu(
      color: AppColors.whiteColor,
      context: context,
      position: RelativeRect.fromLTRB(100.w, 85.h, 20.w, 40.h),
      items: [
        PopupMenuItem<String>(
          /* onTap: () => updateMypostViewModel.deletePost(
            context,
            widget.userPostsData.id.toString(),
            index,
          ), */
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => CustomDialog(
                title: AppLocalizations.of(context)!.deletePost,
                subTitle: AppLocalizations.of(context)!
                    .areYouSureYouWantToDeleteThePost,
                buttonText: AppLocalizations.of(context)!.yes,
                icon: HugeIcons.strokeRoundedAlertCircle,
                onConfirm: () {
                  updateMypostViewModel.deletePost(
                    context,
                    widget.userPostsData.id.toString(),
                    index,
                  );

                  Navigator.of(context, rootNavigator: true).pop();
                },
                onCancel: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            );
          },
          child: Text(
            AppLocalizations.of(context)!.deletePost,
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
    );
  }
}
