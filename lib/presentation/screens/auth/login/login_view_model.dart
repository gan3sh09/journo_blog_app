part of 'login_imports.dart';

class LoginViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool showClearEmailIcon = false;
  bool showClearPasswordIcon = false;
}
