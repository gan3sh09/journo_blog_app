part of 'common_widgets_imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final String? counterText;
  final FocusNode? focusNode;
  final String? labelText;
  final bool obscureText;
  final Color? fillColor;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.maxLength,
    this.onChanged,
    this.counterText,
    this.focusNode,
    this.labelText,
    this.obscureText = false,
    this.fillColor,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      cursorColor: AppColors.primaryColor,
      onChanged: onChanged,
      controller: controller,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      maxLength: maxLength,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.labelLarge,
      decoration: InputDecoration(
        labelText: labelText,
        counterText: counterText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        errorBorder: _buildErrorBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        fillColor: fillColor ?? AppColors.textFormFieldColor,
        filled: true,
      ),
      onFieldSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
      },
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.redAccent,
      ),
    );
  }
}
