part of 'common_widgets_imports.dart';

class CustomCachedImage extends StatelessWidget {
  final String photoUrl;
  final double? width;
  final double? height;

  const CustomCachedImage({
    super.key,
    required this.photoUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: photoUrl,
      fit: BoxFit.cover,
      placeholder: (_, __) => Center(
        child: CupertinoActivityIndicator(
          color: AppColors.primaryColor,
        ),
      ),
      errorWidget: (_, __, ___) => const Center(
        child: Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}
