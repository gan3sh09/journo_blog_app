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
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.primaryColor,
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
                  showChildOpacityTransition: false,
                  backgroundColor: AppColors.whiteColor,
                  key: homeViewModel.homeRefreshIndicatorKey,
                  color: AppColors.primaryColor,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Heading
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                context
                                    .read<VelocityBloc<ProfileModel>>()
                                    .state
                                    .data
                                    .userDetails!
                                    .name
                                    .toString(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                width: 45.w,
                                height: 45.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CustomCachedImage(
                                    photoUrl: context
                                        .read<VelocityBloc<ProfileModel>>()
                                        .state
                                        .data
                                        .userDetails!
                                        .profilePhotoUrl
                                        .toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 6,
                          thickness: 1,
                          color: Colors.grey.shade200,
                        ),
                        15.heightBox,
                        // Advertisement
                        SizedBox(
                          height: 200.h,
                          child: CarouselSlider.builder(
                            itemCount: state.data.popularPosts!.length,
                            carouselController:
                                homeViewModel.carouselSliderController,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: CustomCachedImage(
                                    photoUrl: state
                                        .data.popularPosts![index].featuredimage
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 200.h,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.77,
                              onPageChanged: (index, reason) {
                                homeViewModel.currentIndex = index;
                              },
                            ),
                          ),
                        ),
                        20.heightBox,
                        // Body
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.latestPost,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                AppLocalizations.of(context)!.seeAll,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                        10.heightBox,
                        // Latest Posts
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
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
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
