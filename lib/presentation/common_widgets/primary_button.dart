part of 'common_widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(SizeConfig.screenWidth, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
