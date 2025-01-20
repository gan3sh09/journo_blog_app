part of 'common_widgets_imports.dart';

Future<bool?> showExitDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (_) => CustomDialog(
      title: AppLocalizations.of(context)!.confirmExit,
      subTitle: AppLocalizations.of(context)!.confirmExitText,
      buttonText: AppLocalizations.of(context)!.yes,
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
