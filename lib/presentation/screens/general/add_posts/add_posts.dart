part of 'add_post_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostViewModel addPostViewModel;

  @override
  void initState() {
    super.initState();
    addPostViewModel = AddPostViewModel(repository: context.read<Repository>());
  }

  @override
  void dispose() {
    addPostViewModel.textEditingController.dispose();
    addPostViewModel.controller.dispose();
    addPostViewModel.focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await showExitDialog(context) ?? false;
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                AppLocalizations.of(context)!.addPost,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: addPostViewModel.isLoadingBloc,
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          if (!addPostViewModel.formKey.currentState!
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
                          } else {
                            addPostViewModel.addNewPost(
                              context,
                              context
                                  .read<VelocityBloc<ProfileModel>>()
                                  .state
                                  .data
                                  .userDetails!
                                  .id
                                  .toString(),
                            );
                          }
                        },

                        /*  onPressed: () => addPostViewModel.addNewPost(
                          context,
                          context
                              .read<VelocityBloc<ProfileModel>>()
                              .state
                              .data
                              .userDetails!
                              .id
                              .toString(),
                        ), */
                        /* onPressed: () {
                          log(
                            context
                                .read<VelocityBloc<ProfileModel>>()
                                .state
                                .data
                                .userDetails!
                                .id
                                .toString(),
                          );
                        }, */
                        icon: state.data == true
                            ? CupertinoActivityIndicator(
                                color: AppColors.whiteColor,
                              )
                            : Icon(
                                HugeIcons.strokeRoundedTick01,
                                size: 28.h,
                              ),
                      );
                    },
                  ),
                )
              ],
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                key: addPostViewModel.formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  children: [
                    BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
                      bloc: addPostViewModel.selectedImageBloc,
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
                                  : Image.asset(
                                      AppAssets
                                          .assetsImagesAddPostsImagePlaceholder,
                                    ),
                            ),
                            Positioned(
                              right: 10.w,
                              bottom: 10.h,
                              child: IconButton(
                                onPressed: () =>
                                    addPostViewModel.pickImage(context),
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
                      controller: addPostViewModel.textEditingController,
                      keyboardType: TextInputType.text,
                      validator: (title) {
                        if (title == null || title.isEmpty) {
                          return AppLocalizations.of(context)!
                              .pleaseEnterATitle;
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
                      controller: addPostViewModel.textEditingController,
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
                    BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
                      bloc: addPostViewModel.selectedTagBloc,
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            var data = await AutoRouter.of(context).push<Tag>(
                                TagsRoute(navigateType: NavigateType.inner));
                            // log(data!.title.toString());
                            addPostViewModel.selectedTagBloc.onUpdateData(data);
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
                                          borderRadius:
                                              BorderRadius.circular(4.r),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
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
                      AppLocalizations.of(context)!.category,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    5.heightBox,
                    BlocBuilder<VelocityBloc<Category?>,
                        VelocityState<Category?>>(
                      bloc: addPostViewModel.selectedCategoryBloc,
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            var data = await AutoRouter.of(context)
                                .push<Category>(CategoriesRoute(
                                    navigateType: NavigateType.inner));
                            // log(data!.title.toString());
                            addPostViewModel.selectedCategoryBloc
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
                                          borderRadius:
                                              BorderRadius.circular(4.r),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
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
                        controller: addPostViewModel.controller,
                        configurations:
                            const QuillSimpleToolbarConfigurations(),
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
                      child: Stack(
                        children: [
                          QuillEditor.basic(
                            controller: addPostViewModel.controller,
                            focusNode: addPostViewModel.focusNode,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
