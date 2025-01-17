part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  final Post latestPosts;
  const HomeDetails({super.key, required this.latestPosts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          latestPosts.title.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        leading: AutoLeadingButton(),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: ListView(
          children: [
            Hero(
              tag: Key(latestPosts.id.toString()),
              child: CustomCachedImage(
                photoUrl: latestPosts.featuredimage.toString(),
              ),
            ),
            10.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    latestPosts.title.toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedEye,
                        color: AppColors.greyColor,
                      ),
                      5.widthBox,
                      Text(
                        '${latestPosts.views} Views',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '120',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      3.widthBox,
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.thumbsDown,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        '0',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  HtmlWidget(
                    latestPosts.body.toString(),
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
