part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
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
    super.initState();
  }

  @override
  void dispose() {
    loginViewModel.emailController.dispose();
    loginViewModel.passwordController.dispose();
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
                          child: Form(
                            key: loginViewModel.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                50.heightBox,
                                Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.login,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                                48.heightBox,
                                Text(
                                  AppLocalizations.of(context)!.email,
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
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .pleaseEnterYourEmail;
                                    } else if (!email.isValidEmail) {
                                      return AppLocalizations.of(context)!
                                          .pleaseEnterValidEmail;
                                    }
                                    return null;
                                  },
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
                                            loginViewModel.emailController
                                                .clear();
                                            setState(() {
                                              loginViewModel
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
                                  controller: loginViewModel.passwordController,
                                  keyboardType: TextInputType.text,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .pleaseEnterYourPassword;
                                    }
                                    /* else if (!password.isValidPassword) {
                                      return 'Please enter valid password';
                                    } */
                                    else if (password.length < 6) {
                                      return AppLocalizations.of(context)!
                                          .passwordMustBeAtLeastSixCharacter;
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icon(
                                    HugeIcons.strokeRoundedFingerAccess,
                                    color: AppColors.textColor,
                                  ),
                                  obscureText:
                                      !loginViewModel.isPasswordVisible,
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
                                        if (loginViewModel
                                            .showClearPasswordIcon)
                                          GestureDetector(
                                            onTap: () {
                                              loginViewModel.passwordController
                                                  .clear();
                                              setState(() {
                                                loginViewModel
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
                                              loginViewModel.isPasswordVisible =
                                                  !loginViewModel
                                                      .isPasswordVisible;
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
                                  leftText:
                                      AppLocalizations.of(context)!.rememberMe,
                                  rightText: AppLocalizations.of(context)!
                                      .forgotPassword,
                                ),
                                40.heightBox,
                                BlocBuilder<VelocityBloc<bool>,
                                    VelocityState<bool>>(
                                  bloc: loginViewModel.isLoadingBloc,
                                  builder: (context, state) {
                                    return PrimaryButton(
                                      title:
                                          AppLocalizations.of(context)!.login,
                                      isLoading: state.data,
                                      onPressed: () {
                                        if (loginViewModel.formKey.currentState!
                                            .validate()) {
                                          loginViewModel.login(context);
                                        }
                                      },
                                    );
                                  },
                                ),
                                20.heightBox,
                                Center(
                                  child: CustomRichText(
                                    text: AppLocalizations.of(context)!
                                        .donotHaveAnAccount,
                                    textspan:
                                        AppLocalizations.of(context)!.signUp,
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
