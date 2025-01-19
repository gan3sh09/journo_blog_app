part of 'common_widgets_imports.dart';

Future<bool?> showExitDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (_) => CustomDialog(
      title: 'Confirm Exit',
      subTitle: 'Are you sure you want to exit app?',
      buttonText: 'Exit',
      icon: HugeIcons.strokeRoundedLogout05,
      onConfirm: () {
        exit(0);
        // Navigator.of(context).pop(true);
      },
      onCancel: () {
        Navigator.of(context).pop(false);
      },
    ),
  );
}
