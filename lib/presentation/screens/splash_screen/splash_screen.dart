part of 'splash_imports.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToOnboarding();
    super.initState();
  }

  navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // AutoRouter.of(context).replace(const OnboardingScreenRoute());
        context.router.replace(const OnboardingScreenRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: FadedScaleAnimation(
            child: Image.asset(
              AppAssets.assetsImagesLogo,
              height: 42.h,
              width: 139.w,
            ),
          ),
        ),
      ),
    );
  }
}
