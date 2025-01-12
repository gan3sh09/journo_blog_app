part of 'widgets_import.dart';

class OnboradWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  const OnboradWidget({
    required this.imagePath,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 333.h,
          width: 333.w,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
