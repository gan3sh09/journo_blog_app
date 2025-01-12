part of 'register_imports.dart';

class RegisterViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool showClearEmailIcon = false;
  bool showClearPasswordIcon = false;
  bool showClearConfirmPasswordIcon = false;
}
