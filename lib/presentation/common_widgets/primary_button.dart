part of 'common_widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading,
  });

  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(SizeConfig.screenWidth, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
      onPressed: onPressed,
      child: isLoading == true
          ? CupertinoActivityIndicator(
              color: AppColors.whiteColor,
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
    );
  }
}
