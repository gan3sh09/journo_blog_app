part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          page: SplashScreenRoute.page,
          durationInMilliseconds: 400,
          path: "/",
          initial: true,
        ),
        CustomRoute(
          page: OnboardingScreenRoute.page,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: AuthRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: GeneralRoute.page,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: HomeDetailsRoute.page,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: AddTagsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: UpdateTagsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: AddCategoryRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: UpdateCategoryRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: TagsRoute.page,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: CategoriesRoute.page,
          durationInMilliseconds: 400,
        ),
      ];
}
