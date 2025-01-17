part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({
    required this.repository,
  });

  final GlobalKey<LiquidPullToRefreshState> profileRefreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  final VelocityBloc<ProfileModel> profileModelBloc =
      VelocityBloc<ProfileModel>(ProfileModel());

  getUserProfileData() async {
    var userProfileData = await repository.postsRepo.getUserPosts();
    if (userProfileData.status == 1) {
      profileModelBloc.onUpdateData(userProfileData);
    }
  }

  logout(context) async {
    var data = await repository.authRepo.userLogout(context);
    if (data.message != null && data.message!.isNotEmpty) {
      Utils.clearAllSaveData();
      AutoRouter.of(context).replace(const LoginRoute());
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        // label: data.message.toString(),
        label: 'You have successfully Logged out.',
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }
  }
}
