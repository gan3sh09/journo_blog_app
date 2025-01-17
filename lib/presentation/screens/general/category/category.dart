part of 'category_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

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
          automaticallyImplyLeading: false,
          title: Text('Categories'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                onPressed: () => categoriesViewModel.gotoAddCategories(context),
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
                      title: Text(
                        categoriesData.title ?? "No Category",
                        style: Theme.of(context).textTheme.labelLarge,
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
                              color: Colors.green,
                            ),
                          ),
                          25.widthBox,
                          GestureDetector(
                            /* onTap: () => categoriesViewModel.deleteCategories(
                              context,
                              categoriesData.id.toString(),
                              index,
                            ), */
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => CustomDialog(
                                  title: 'Confirm Delete',
                                  subTitle:
                                      'Are you sure you want to delete this category?',
                                  buttonText: 'Delete',
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
