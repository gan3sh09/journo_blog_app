part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterViewModel registerViewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    registerViewModel.emailController.addListener(() {
      setState(() {
        registerViewModel.showClearEmailIcon =
            registerViewModel.emailController.text.isNotEmpty;
      });
    });
    registerViewModel.passwordController.addListener(() {
      setState(() {
        registerViewModel.showClearPasswordIcon =
            registerViewModel.passwordController.text.isNotEmpty;
      });
    });
    registerViewModel.confirmPasswordController.addListener(() {
      setState(() {
        registerViewModel.showClearConfirmPasswordIcon =
            registerViewModel.confirmPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    registerViewModel.emailController.dispose();
    registerViewModel.passwordController.dispose();
    registerViewModel.confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
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
                                  AppLocalizations.of(context)!.register,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              48.heightBox,
                              Text(
                                AppLocalizations.of(context)!.email,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              5.heightBox,
                              CustomTextFormField(
                                controller: registerViewModel.emailController,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  HugeIcons.strokeRoundedMail01,
                                  color: AppColors.textColor,
                                ),
                                hintText: 'gan3shpandit@gmail.com',
                                onChanged: (value) {
                                  setState(() {
                                    registerViewModel.showClearEmailIcon =
                                        value.isNotEmpty;
                                  });
                                },
                                suffixIcon: registerViewModel.showClearEmailIcon
                                    ? IconButton(
                                        onPressed: () {
                                          registerViewModel.emailController
                                              .clear();
                                          setState(() {
                                            registerViewModel
                                                .showClearEmailIcon = false;
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
                                AppLocalizations.of(context)!.password,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              5.heightBox,
                              CustomTextFormField(
                                controller:
                                    registerViewModel.passwordController,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  HugeIcons.strokeRoundedFingerAccess,
                                  color: AppColors.textColor,
                                ),
                                obscureText:
                                    !registerViewModel.isPasswordVisible,
                                onChanged: (value) {
                                  setState(() {
                                    registerViewModel.showClearPasswordIcon =
                                        value.isNotEmpty;
                                  });
                                },
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (registerViewModel
                                          .showClearPasswordIcon)
                                        GestureDetector(
                                          onTap: () {
                                            registerViewModel.passwordController
                                                .clear();
                                            setState(() {
                                              registerViewModel
                                                      .showClearPasswordIcon =
                                                  false;
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
                                            registerViewModel
                                                    .isPasswordVisible =
                                                !registerViewModel
                                                    .isPasswordVisible;
                                          });
                                        },
                                        child: Icon(
                                          registerViewModel.isPasswordVisible
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
                              20.heightBox,
                              Text(
                                AppLocalizations.of(context)!.confirmPassword,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              5.heightBox,
                              CustomTextFormField(
                                controller:
                                    registerViewModel.confirmPasswordController,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  HugeIcons.strokeRoundedFingerAccess,
                                  color: AppColors.textColor,
                                ),
                                obscureText:
                                    !registerViewModel.isConfirmPasswordVisible,
                                onChanged: (value) {
                                  setState(() {
                                    registerViewModel
                                            .showClearConfirmPasswordIcon =
                                        value.isNotEmpty;
                                  });
                                },
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (registerViewModel
                                          .showClearConfirmPasswordIcon)
                                        GestureDetector(
                                          onTap: () {
                                            registerViewModel
                                                .confirmPasswordController
                                                .clear();
                                            setState(() {
                                              registerViewModel
                                                      .showClearConfirmPasswordIcon =
                                                  false;
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
                                            registerViewModel
                                                    .isConfirmPasswordVisible =
                                                !registerViewModel
                                                    .isConfirmPasswordVisible;
                                          });
                                        },
                                        child: Icon(
                                          registerViewModel
                                                  .isConfirmPasswordVisible
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
                                leftText:
                                    AppLocalizations.of(context)!.rememberMe,
                              ),
                              40.heightBox,
                              PrimaryButton(
                                title: AppLocalizations.of(context)!.register,
                                onPressed: () {},
                              ),
                              20.heightBox,
                              Center(
                                child: CustomRichText(
                                  text: AppLocalizations.of(context)!
                                      .alreadyHaveAnAccount,
                                  textspan: AppLocalizations.of(context)!.login,
                                  onTap: () => context.router
                                      .replace(const LoginRoute()),
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
      ),
    );
  }
}
