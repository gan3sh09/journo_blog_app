part of 'home_imports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    AppAssets.assetsImagesHomeBanner,
                  ),
                ),
                20.heightBox,
                Row(
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
                10.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (context, index) => 20.heightBox,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              context.router.push(const HomeDetailsRoute()),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              AppAssets.assetsImagesHomeBanner,
                              height: 120.h,
                              width: 180.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BBC bin oculars: How to spot birds in the UK',
                                style: Theme.of(context).textTheme.labelMedium,
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
                                  Text(
                                    '3 months ago',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                              6.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '120 Views',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
