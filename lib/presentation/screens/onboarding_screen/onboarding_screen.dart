part of 'onboarding_imports.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardViewModel onBoardViewModel = OnboardViewModel();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 25.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.assetsImagesLogo,
                  color: AppColors.primaryColor,
                  height: 42.h,
                  width: 139.w,
                ),
                63.heightBox,
                Expanded(
                  child: PageView(
                    controller: onBoardViewModel.pageController,
                    children: [
                      OnboradWidget(
                        imagePath:
                            AppAssets.assetsImagesOnboardingImagesOnboard1,
                        text:
                            'Discover, engage and read the latest articles oras well as share your own thoughts and ideas with the community',
                      ),
                      OnboradWidget(
                        imagePath:
                            AppAssets.assetsImagesOnboardingImagesOnboard2,
                        text:
                            'Customize your reading experience and join the conversation by creating an account.',
                      ),
                      OnboradWidget(
                        imagePath:
                            AppAssets.assetsImagesOnboardingImagesOnboard3,
                        text:
                            'Explore a wide selection of categories, or use the search bar to find specific topics',
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  title: 'Get Started',
                  onPressed: () => context.router.push(const AuthRoute()),
                ),
                51.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skip",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SmoothPageIndicator(
                      controller: onBoardViewModel.pageController,
                      count: 3,
                      effect: SwapEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                      onDotClicked: (index) {},
                    ),
                    Text(
                      "Next",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
