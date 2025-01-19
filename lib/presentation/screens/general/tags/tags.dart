part of 'tags_imports.dart';

@RoutePage()
class Tags extends StatefulWidget {
  final NavigateType navigateType;
  const Tags({super.key, required this.navigateType});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;

  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              NavigateType.outer == widget.navigateType ? true : false,
          title: Text(
            AppLocalizations.of(context)!.tags,
          ),
          leading: AutoLeadingButton(),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 40.w),
              child: IconButton(
                onPressed: () => tagsViewModel.gotoAddTags(context),
                icon: Badge(
                  label: Text(
                    AppLocalizations.of(context)!.add,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  child: Icon(
                    HugeIcons.strokeRoundedAdd02,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
          bloc: tagsViewModel.tagsModelBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const TagsShimmer();
            } else if (state is VelocityUpdateState) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.data.tags!.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => 10.heightBox,
                itemBuilder: (context, index) {
                  final tagsData = state.data.tags![index];

                  return Card(
                    color: AppColors.whiteColor,
                    child: ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          NavigateType.outer == widget.navigateType
                              ? null
                              : AutoRouter.of(context).maybePop<Tag>(tagsData);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColors.scafLightBackground,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            tagsData.title ?? "No Title",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => tagsViewModel.gotoUpdateTags(
                              context,
                              tagsData,
                            ),
                            child: Icon(
                              HugeIcons.strokeRoundedTaskEdit02,
                              color: Colors.green,
                            ),
                          ),
                          25.widthBox,
                          GestureDetector(
                            /*  onTap: () => tagsViewModel.deleteTags(
                              context,
                              tagsData.id.toString(),
                              index,
                            ), */
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => CustomDialog(
                                  title: AppLocalizations.of(context)!
                                      .confirmDelete,
                                  subTitle: AppLocalizations.of(context)!
                                      .deleteTagText,
                                  buttonText: AppLocalizations.of(context)!.yes,
                                  icon: HugeIcons.strokeRoundedAlertCircle,
                                  onConfirm: () {
                                    tagsViewModel.deleteTags(
                                      context,
                                      tagsData.id.toString(),
                                      index,
                                    );
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  onCancel: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                ),
                              );
                            },
                            child: Icon(
                              HugeIcons.strokeRoundedDelete02,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}




/* class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Tags'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                onPressed: () {},
                icon: Badge(
                  label: Text(
                    'Add',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  child: Icon(
                    HugeIcons.strokeRoundedAdd02,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context, index) => 10.heightBox,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.whiteColor,
              child: ListTile(
                leading: Text(
                  "${index + 1}".toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                title: Text(
                  "Enter a Tags",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        HugeIcons.strokeRoundedTaskEdit02,
                        color: Colors.green,
                      ),
                    ),
                    25.widthBox,
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        HugeIcons.strokeRoundedDelete02,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
 */