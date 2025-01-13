part of 'tags_imports.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TagsBloc(
        Repository(
          tagsRepo: TagsRepo(),
        ),
      )..add(
          FetchTagsEvent(),
        ),
      child: AnnotatedRegion(
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
          body: BlocBuilder<TagsBloc, TagsState>(
            builder: (context, state) {
              if (state is TagsInitial || state is TagsLoading) {
                return const TagsShimmer();
              } else if (state is TagsLoaded) {
                final tags = state.tags;

                if (tags.isEmpty) {
                  return NoInternetConnection();
                }
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tags.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => 10.heightBox,
                  itemBuilder: (context, index) {
                    final tag = tags[index];
                    return Card(
                      color: AppColors.whiteColor,
                      child: ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        title: Text(
                          tag.title ?? "No Title",
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
              } else if (state is TagsError) {
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