part of 'common_widgets_imports.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    this.text,
    this.textspan,
    required this.onTap,
  });

  final String? text;
  final String? textspan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: textspan,
            style: Theme.of(context).textTheme.bodyLarge,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
