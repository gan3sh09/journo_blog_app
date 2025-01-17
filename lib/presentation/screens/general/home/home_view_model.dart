part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;

  final PageController pageController = PageController();

  HomeViewModel({required this.repository});

  final GlobalKey<LiquidPullToRefreshState> homeRefreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  final VelocityBloc<HomeModel> postBloc = VelocityBloc<HomeModel>(HomeModel());

  fetchAllPosts() async {
    var postsData = await repository.postsRepo.getAllPosts();

    if (postsData.status == 1) {
      postBloc.onUpdateData(postsData);
    }
  }
}
