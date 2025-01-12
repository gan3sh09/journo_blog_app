part of 'profile_imports.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    HugeIcons.strokeRoundedLogout03,
                    size: 24,
                  )),
            )
          ],
        ),
        body: ListView(
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
                  CircleAvatar(
                    radius: 60.r,
                    backgroundImage:
                        AssetImage(AppAssets.assetsImagesHomeBanner),
                  ),
                  10.heightBox,
                  Text(
                    'Ganesh Pandit',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'gan3shpandit@gmail.com',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  20.heightBox,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec arcu venenatis quam efficitur luctus vel id orci.',
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
                            '6',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '210',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'Following',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '2101',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.displaySmall,
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
                    'My Posts',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  15.heightBox,
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        // mainAxisSpacing: 10.h,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                AppAssets.assetsImagesHomeBanner,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    HugeIcons.strokeRoundedMoreVertical,
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
      ),
    );
  }
}
