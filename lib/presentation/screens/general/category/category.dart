part of 'category_imports.dart';

@RoutePage()
class Categories extends StatefulWidget {
  final NavigateType navigateType;
  const Categories({super.key, required this.navigateType});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late CategoriesViewModel categoriesViewModel;

  @override
  void initState() {
    categoriesViewModel =
        CategoriesViewModel(repository: context.read<Repository>());
    categoriesViewModel.fetchAllCategories();
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
          leading: AutoLeadingButton(),
          title: Text(
            AppLocalizations.of(context)!.categories,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 40.w),
              child: IconButton(
                onPressed: () => categoriesViewModel.gotoAddCategories(context),
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
        body: BlocBuilder<VelocityBloc<CategoryModel>,
            VelocityState<CategoryModel>>(
          bloc: categoriesViewModel.categoriesModelBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const TagsShimmer();
            } else if (state is VelocityUpdateState) {
              return ListView.separated(
                itemCount: state.data.categories!.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => 10.heightBox,
                itemBuilder: (context, index) {
                  final categoriesData = state.data.categories![index];
                  return Card(
                    color: AppColors.whiteColor,
                    child: ListTile(
                      leading: Text(
                        "${index + 1}".toString(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          NavigateType.outer == widget.navigateType
                              ? null
                              : AutoRouter.of(context)
                                  .maybePop<Category>(categoriesData);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColors.scafLightBackground,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            categoriesData.title ?? "No Category",
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
                            onTap: () =>
                                categoriesViewModel.gotoUpdateCategories(
                              context,
                              categoriesData,
                            ),
                            child: Icon(
                              HugeIcons.strokeRoundedTaskEdit02,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          25.widthBox,
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => CustomDialog(
                                  title: AppLocalizations.of(context)!
                                      .confirmDelete,
                                  subTitle: AppLocalizations.of(context)!
                                      .deleteCategoryText,
                                  buttonText: AppLocalizations.of(context)!.yes,
                                  icon: HugeIcons.strokeRoundedAlertCircle,
                                  onConfirm: () {
                                    categoriesViewModel.deleteCategories(
                                      context,
                                      categoriesData.id.toString(),
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
