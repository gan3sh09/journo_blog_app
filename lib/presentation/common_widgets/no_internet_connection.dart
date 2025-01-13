part of 'common_widgets_imports.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          size: 60.h,
          color: AppColors.primaryColor,
        ),
        15.heightBox,
        Text(
          'No Internet Connection',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    ));
  }
}
