part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getUserProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PopScope(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context)!.profile,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => CustomDialog(
                        title: AppLocalizations.of(context)!.confirmLogout,
                        subTitle: AppLocalizations.of(context)!.logoutText,
                        buttonText: AppLocalizations.of(context)!.yes,
                        icon: HugeIcons.strokeRoundedLogout03,
                        onConfirm: () {
                          profileViewModel.logout(context);
                          AutoRouter.of(context).maybePop();
                        },
                        onCancel: () {
                          AutoRouter.of(context).maybePop();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    HugeIcons.strokeRoundedLogout03,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          body: BlocBuilder<VelocityBloc<ProfileModel>,
              VelocityState<ProfileModel>>(
            bloc: profileViewModel.profileModelBloc,
            builder: (context, state) {
              if (state is VelocityInitialState) {
                return ProfileShimmer();
              } else if (state is VelocityUpdateState) {
                final userData = state.data.userDetails;
                return LiquidPullToRefresh(
                  key: profileViewModel.profileRefreshIndicatorKey,
                  onRefresh: () => profileViewModel.getUserProfileData(context),
                  showChildOpacityTransition: false,
                  backgroundColor: AppColors.whiteColor,
                  color: AppColors.primaryColor,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 30.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* CircleAvatar(
                              radius: 60.r,
                              backgroundImage:
                                  AssetImage(AppAssets.assetsImagesHomeBanner),
                            ), */
                            SizedBox(
                              width: 120.w,
                              height: 120.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CustomCachedImage(
                                    photoUrl:
                                        userData!.profilePhotoUrl.toString()),
                              ),
                            ),
                            10.heightBox,
                            Text(
                              userData.name.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              userData.email.toString(),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            20.heightBox,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                userData.about.toString(),
                                style: Theme.of(context).textTheme.labelSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      state.data.postsCount.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.posts,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '210',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.following,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '2101',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.followers,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.heightBox,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.myPosts,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            15.heightBox,
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: state.data.posts?.length,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.w,
                                  mainAxisSpacing: 15.h,
                                  childAspectRatio: 0.99,
                                ),
                                itemBuilder: (context, index) {
                                  final userPostsData =
                                      state.data.posts![index];
                                  final imagePath =
                                      'https://techblog.codersangam.com/${userPostsData.featuredimage.toString().replaceAll('public', 'storage')}';
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: CustomCachedImage(
                                            photoUrl: imagePath.toString(),
                                          ),
                                        ),
                                      ),
                                      3.heightBox,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.35,
                                            child: Text(
                                              userPostsData.title.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              HugeIcons
                                                  .strokeRoundedMoreVertical,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
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
