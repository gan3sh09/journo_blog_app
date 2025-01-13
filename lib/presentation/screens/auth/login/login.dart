part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    loginViewModel.emailController.addListener(() {
      setState(() {
        loginViewModel.showClearEmailIcon =
            loginViewModel.emailController.text.isNotEmpty;
      });
    });
    loginViewModel.passwordController.addListener(() {
      setState(() {
        loginViewModel.showClearPasswordIcon =
            loginViewModel.passwordController.text.isNotEmpty;
      });
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      AppAssets.assetsImagesLogo,
                      height: 42.h,
                      width: 139.w,
                    ),
                  ),
                  90.heightBox,
                  FadedScaleAnimation(
                    child: Container(
                      height: screenHeight(context),
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36.r),
                          topRight: Radius.circular(36.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            50.heightBox,
                            Center(
                              child: Text(
                                'Login',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            48.heightBox,
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            5.heightBox,
                            CustomTextFormField(
                              controller: loginViewModel.emailController,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                HugeIcons.strokeRoundedMail01,
                                color: AppColors.textColor,
                              ),
                              hintText: 'gan3shpandit@gmail.com',
                              onChanged: (value) {
                                setState(() {
                                  loginViewModel.showClearEmailIcon =
                                      value.isNotEmpty;
                                });
                              },
                              suffixIcon: loginViewModel.showClearEmailIcon
                                  ? IconButton(
                                      onPressed: () {
                                        loginViewModel.emailController.clear();
                                        setState(() {
                                          loginViewModel.showClearEmailIcon =
                                              false;
                                        });
                                      },
                                      icon: Icon(
                                        HugeIcons
                                            .strokeRoundedMultiplicationSign,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                            ),
                            20.heightBox,
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            5.heightBox,
                            CustomTextFormField(
                              controller: loginViewModel.passwordController,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                HugeIcons.strokeRoundedFingerAccess,
                                color: AppColors.textColor,
                              ),
                              obscureText: !loginViewModel.isPasswordVisible,
                              onChanged: (value) {
                                setState(() {
                                  loginViewModel.showClearPasswordIcon =
                                      value.isNotEmpty;
                                });
                              },
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (loginViewModel.showClearPasswordIcon)
                                      GestureDetector(
                                        onTap: () {
                                          loginViewModel.passwordController
                                              .clear();
                                          setState(() {
                                            loginViewModel
                                                .showClearPasswordIcon = false;
                                          });
                                        },
                                        child: Icon(
                                          HugeIcons
                                              .strokeRoundedMultiplicationSign,
                                          size: 20,
                                        ),
                                      ),
                                    12.widthBox,
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          loginViewModel.isPasswordVisible =
                                              !loginViewModel.isPasswordVisible;
                                        });
                                      },
                                      child: Icon(
                                        loginViewModel.isPasswordVisible
                                            ? HugeIcons.strokeRoundedEye
                                            : HugeIcons
                                                .strokeRoundedViewOffSlash,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.heightBox,
                            RememberMeWidget(
                              leftText: 'Remember me',
                              rightText: 'Forgot Password?',
                            ),
                            40.heightBox,
                            PrimaryButton(
                              title: 'Login',
                              onPressed: () => context.router.replace(
                                const GeneralRoute(),
                              ),
                            ),
                            20.heightBox,
                            Center(
                              child: CustomRichText(
                                text: 'Don’t have an account?',
                                textspan: '  Sign Up',
                                onTap: () => context.router.replace(
                                  const RegisterRoute(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
