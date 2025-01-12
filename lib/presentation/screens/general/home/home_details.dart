part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BBC bin oculars: How to spot birds in the UK BBC bin oculars: How to spot birds in the UK',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        leading: AutoLeadingButton(),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.assetsImagesHomeBanner,
          ),
          10.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Text(
                  'BBC bin oculars: How to spot birds in the UK',
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
                      '120 Views',
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
                      '120',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec arcu venenatis quam efficitur luctus vel id orci. Nam tempor, felis sit amet vestibulum auctor, ante diam tempor elit, quis varius nisi erat lobortis ex. Fusce fermentum erat sed facilisis fermentum. Cras nisi sapien, auctor quis feugiat et, tristique ut purus. Ut volutpat urna nisl, nec malesuada ipsum pulvinar in. Fusce efficitur vel nisl a tempor. Praesent a mauris et urna iaculis posuere. Nam nec vestibulum enim. Etiam accumsan velit eros, vitae bibendum tellus semper luctus. Vestibulum rhoncus tempus mauris sit amet pretium. Cras lectus elit, euismod in tellus quis, sodales scelerisque ante. Suspendisse justo augue, faucibus ut lacus a, fermentum fringilla ligula. Curabitur sed nunc eget leo mollis cursus et et felis. Duis neque odio, tincidunt volutpat laoreet non, laoreet sed purus. Nulla tempus id arcu non tincidunt.',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
