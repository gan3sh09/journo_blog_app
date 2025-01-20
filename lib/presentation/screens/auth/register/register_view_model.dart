part of 'register_imports.dart';

class RegisterViewModel {
  final Repository repository;

  RegisterViewModel({required this.repository});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool showClearEmailIcon = false;
  bool showClearPasswordIcon = false;
  bool showClearConfirmPasswordIcon = false;
  final formKey = GlobalKey<FormState>();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  register(context) async {
    isLoadingBloc.onUpdateData(true);
    var registerData = await repository.authRepo.userRegister(
      nameController.text,
      emailController.text,
      passwordController.text,
      context,
    );
    if (registerData.data != null) {
      AutoRouter.of(context).replace(const LoginRoute());
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.success,
        label: AppLocalizations.of(context)!.youHaveBeenRegisteredSuccessfully,
        // label: e.toString(),
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
    isLoadingBloc.onUpdateData(false);
  }
}
