part of 'common_widgets_imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final String? counterText;
  final FocusNode? focusNode;
  final String? labelText;
  final bool? obscureText;
  final Color? fillColor;
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
    this.validator,
    this.maxLength,
    this.onChanged,
    this.counterText,
    this.focusNode,
    this.labelText,
    this.obscureText,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      cursorColor: AppColors.primaryColor,
      onChanged: onChanged,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly ?? false,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onTap: onTap,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.redAccent,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        fillColor: fillColor ?? AppColors.textFormFieldColor,
        filled: true,
      ),
    );
  }
}
