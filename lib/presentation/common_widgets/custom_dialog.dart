part of 'common_widgets_imports.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool? isLoading;
  final String title;
  final String subTitle;
  final String buttonText;
  final IconData? icon;

  const CustomDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.icon,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.scafLightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              // HugeIcons.strokeRoundedLogout03,
              icon,
              size: 50,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            Text(
              // 'Confirm Logout',
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              // 'Are you sure you want to log out?',
              subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    onPressed: onCancel,
                    text: 'Cancel',
                  ),
                ),
                12.widthBox,
                Expanded(
                  child: PrimaryButton(
                    title: buttonText,
                    onPressed: onConfirm,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
