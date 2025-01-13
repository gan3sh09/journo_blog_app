part of 'category_imports.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc(
        CategoryRepo(),
      )..add(
          FetchCategoryEvent(),
        ),
      child: AnnotatedRegion(
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
          body: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial || state is CategoryLoading) {
                return const TagsShimmer();
              } else if (state is CategoryLoaded) {
                final category = state.category;
                if (category.isEmpty) {
                  return NoInternetConnection();
                } else {
                  return ListView.separated(
                    itemCount: category.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => 10.heightBox,
                    itemBuilder: (context, index) {
                      final categories = category[index];
                      return Card(
                        color: AppColors.whiteColor,
                        child: ListTile(
                          leading: Text(
                            "${index + 1}".toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          title: Text(
                            categories.title ?? "No Category",
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
                  );
                }
              } else if (state is CategoryError) {
                return Center(child: Text(state.errorMessage));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
