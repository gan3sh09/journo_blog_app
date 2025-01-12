part of 'widgets_import.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({
    super.key,
    this.leftText,
    this.rightText,
  });

  final String? leftText;
  final String? rightText;

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.primaryColor,
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            Text(
              widget.leftText ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            widget.rightText ?? '',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
