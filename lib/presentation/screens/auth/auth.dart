part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.assetsImagesLoginAuthBg),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 25.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      AppAssets.assetsImagesLogo,
                      height: 42.h,
                      width: 139.w,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Explore the world,\nBillions of Thoughts.',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                  20.heightBox,
                  PrimaryButton(
                    title: 'Login',
                    onPressed: () => context.router.push(const LoginRoute()),
                  ),
                  12.heightBox,
                  OutlineButton(
                    text: 'Register',
                    onPressed: () => context.router.push(const RegisterRoute()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
