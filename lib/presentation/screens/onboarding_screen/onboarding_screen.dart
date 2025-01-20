part of 'onboarding_imports.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardViewModel onBoardViewModel;

  @override
  void initState() {
    onBoardViewModel = OnboardViewModel();
    super.initState();
  }

  @override
  void dispose() {
    onBoardViewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          final bool shouldPop = await showExitDialog(context) ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAssets.assetsImagesLogo,
                        color: AppColors.primaryColor,
                        height: 42.h,
                        width: 139.w,
                      ),
                      BlocBuilder<LocaleCubit, Locale>(
                        builder: (context, locale) {
                          return GestureDetector(
                            onTap: () => _showLanguagePopupMenu(context),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                width: SizeConfig.screenWidth * 0.295,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.language,
                                      color: AppColors.textColor,
                                    ),
                                    5.widthBox,
                                    Text(
                                      AppLocalizations.of(context)!.language,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  53.heightBox,
                  Expanded(
                    child: PageView(
                      controller: onBoardViewModel.pageController,
                      onPageChanged: (index) {
                        setState(() {
                          onBoardViewModel.currentIndex = index;
                        });
                      },
                      children: [
                        OnboradWidget(
                          imagePath:
                              AppAssets.assetsImagesOnboardingImagesOnboard1,
                          text: AppLocalizations.of(context)!
                              .onboardDescriptionOne,
                        ),
                        OnboradWidget(
                          imagePath:
                              AppAssets.assetsImagesOnboardingImagesOnboard2,
                          text: AppLocalizations.of(context)!
                              .onboardDescriptionTwo,
                        ),
                        OnboradWidget(
                          imagePath:
                              AppAssets.assetsImagesOnboardingImagesOnboard3,
                          text: AppLocalizations.of(context)!
                              .onboardDescriptionThree,
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    title: AppLocalizations.of(context)!.getStarted,
                    onPressed: () =>
                        AutoRouter.of(context).push(const AuthRoute()),
                    /* onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      var token = prefs.getString('token');
                      log(token.toString());
                    }, */
                  ),
                  51.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            AutoRouter.of(context).push(const AuthRoute()),
                        child: Text(
                          AppLocalizations.of(context)!.skip,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
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
                      GestureDetector(
                        onTap: () => onBoardViewModel.goToNextPage(),
                        child: Text(
                          AppLocalizations.of(context)!.next,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  void _showLanguagePopupMenu(BuildContext context) {
    showMenu(
      color: AppColors.whiteColor,
      context: context,
      position: RelativeRect.fromLTRB(100.w, 99.h, 25.w, 40.h),
      items: [
        const PopupMenuItem<String>(
          value: 'en',
          child: Text(
            'English',
          ),
        ),
        const PopupMenuItem<String>(
          value: 'ne',
          child: Text(
            'नेपाली',
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
    ).then((value) {
      // ['en', 'ne'].contains(locale.languageCode) ? locale.languageCode : 'en';
      if (value != null) {
        if (context.mounted) {
          context.read<LocaleCubit>().changeLocale(value);
        }
      }
    });
  }
}
