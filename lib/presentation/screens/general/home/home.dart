part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<VelocityBloc<HomeModel>, VelocityState<HomeModel>>(
            bloc: homeViewModel.postBloc,
            builder: (context, state) {
              if (state is VelocityInitialState) {
                return HomeShimmer();
              } else if (state is VelocityUpdateState) {
                return LiquidPullToRefresh(
                  onRefresh: () => homeViewModel.fetchAllPosts(),
                  showChildOpacityTransition: true,
                  backgroundColor: AppColors.whiteColor,
                  key: homeViewModel.homeRefreshIndicatorKey,
                  color: AppColors.primaryColor,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200.h,
                          child: PageView.builder(
                            controller: homeViewModel.pageController,
                            itemCount: state.data.popularPosts!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 12.w, right: 12.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: CustomCachedImage(
                                    photoUrl: state
                                        .data.allPosts![index].featuredimage
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        10.heightBox,
                        SmoothPageIndicator(
                          controller: homeViewModel.pageController,
                          count: state.data.popularPosts!.length,
                          effect: SwapEffect(
                            activeDotColor: AppColors.primaryColor,
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                          onDotClicked: (index) {},
                        ),
                        20.heightBox,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest Posts',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                'See All',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                        10.heightBox,
                        ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.data.allPosts!.length,
                          separatorBuilder: (context, index) => 20.heightBox,
                          itemBuilder: (context, index) {
                            final latestPosts = state.data.allPosts![index];
                            return FadedScaleAnimation(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => context.router.push(
                                      HomeDetailsRoute(
                                        latestPosts: latestPosts,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Hero(
                                        tag: Key(latestPosts.id.toString()),
                                        child: CustomCachedImage(
                                          photoUrl: latestPosts.featuredimage
                                              .toString(),
                                          height: 120.h,
                                          width: 180.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.widthBox,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          latestPosts.title.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          maxLines: 2,
                                        ),
                                        6.heightBox,
                                        Row(
                                          children: [
                                            Icon(
                                              HugeIcons.strokeRoundedTimer01,
                                              color: AppColors.greyColor,
                                            ),
                                            3.widthBox,
                                            /* Text(
                                              latestPosts.createdAt.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ), */
                                            DateConverter(
                                              dateTime: latestPosts.createdAt
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                        6.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${latestPosts.views} Views',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            Icon(
                                              HugeIcons.strokeRoundedBookmark02,
                                              color: AppColors.textColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
