// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:journo_blog_app/presentation/screens/auth/auth_imports.dart'
    as _i3;
import 'package:journo_blog_app/presentation/screens/auth/login/login_imports.dart'
    as _i6;
import 'package:journo_blog_app/presentation/screens/auth/register/register_imports.dart'
    as _i8;
import 'package:journo_blog_app/presentation/screens/general/category/add_category/add_category_import.dart'
    as _i1;
import 'package:journo_blog_app/presentation/screens/general/category/category_model.dart'
    as _i15;
import 'package:journo_blog_app/presentation/screens/general/category/update_category/update_category_import.dart'
    as _i11;
import 'package:journo_blog_app/presentation/screens/general/general_imports.dart'
    as _i4;
import 'package:journo_blog_app/presentation/screens/general/home/home_imports.dart'
    as _i5;
import 'package:journo_blog_app/presentation/screens/general/tags/add_tags/add_tags_import.dart'
    as _i2;
import 'package:journo_blog_app/presentation/screens/general/tags/tags_imports.dart'
    as _i10;
import 'package:journo_blog_app/presentation/screens/general/tags/update_tags/update_tags_import.dart'
    as _i12;
import 'package:journo_blog_app/presentation/screens/onboarding_screen/onboarding_imports.dart'
    as _i7;
import 'package:journo_blog_app/presentation/screens/splash_screen/splash_imports.dart'
    as _i9;

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i13.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i13.PageRouteInfo>? children})
    : super(AddCategoryRoute.name, initialChildren: children);

  static const String name = 'AddCategoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCategory();
    },
  );
}

/// generated route for
/// [_i2.AddTags]
class AddTagsRoute extends _i13.PageRouteInfo<void> {
  const AddTagsRoute({List<_i13.PageRouteInfo>? children})
    : super(AddTagsRoute.name, initialChildren: children);

  static const String name = 'AddTagsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddTags();
    },
  );
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i13.PageRouteInfo<void> {
  const AuthRoute({List<_i13.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.Auth();
    },
  );
}

/// generated route for
/// [_i4.General]
class GeneralRoute extends _i13.PageRouteInfo<void> {
  const GeneralRoute({List<_i13.PageRouteInfo>? children})
    : super(GeneralRoute.name, initialChildren: children);

  static const String name = 'GeneralRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.General();
    },
  );
}

/// generated route for
/// [_i5.HomeDetails]
class HomeDetailsRoute extends _i13.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i14.Key? key,
    required _i5.Post latestPosts,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         HomeDetailsRoute.name,
         args: HomeDetailsRouteArgs(key: key, latestPosts: latestPosts),
         initialChildren: children,
       );

  static const String name = 'HomeDetailsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDetailsRouteArgs>();
      return _i5.HomeDetails(key: args.key, latestPosts: args.latestPosts);
    },
  );
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({this.key, required this.latestPosts});

  final _i14.Key? key;

  final _i5.Post latestPosts;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, latestPosts: $latestPosts}';
  }
}

/// generated route for
/// [_i6.Login]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.Login();
    },
  );
}

/// generated route for
/// [_i7.OnboardingScreen]
class OnboardingScreenRoute extends _i13.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i13.PageRouteInfo>? children})
    : super(OnboardingScreenRoute.name, initialChildren: children);

  static const String name = 'OnboardingScreenRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i8.Register]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.Register();
    },
  );
}

/// generated route for
/// [_i9.SplashScreen]
class SplashScreenRoute extends _i13.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashScreen();
    },
  );
}

/// generated route for
/// [_i10.Tags]
class TagsRoute extends _i13.PageRouteInfo<void> {
  const TagsRoute({List<_i13.PageRouteInfo>? children})
    : super(TagsRoute.name, initialChildren: children);

  static const String name = 'TagsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.Tags();
    },
  );
}

/// generated route for
/// [_i11.UpdateCategory]
class UpdateCategoryRoute extends _i13.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    required _i15.Category categoriesData,
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         UpdateCategoryRoute.name,
         args: UpdateCategoryRouteArgs(
           categoriesData: categoriesData,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'UpdateCategoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateCategoryRouteArgs>();
      return _i11.UpdateCategory(
        categoriesData: args.categoriesData,
        key: args.key,
      );
    },
  );
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({required this.categoriesData, this.key});

  final _i15.Category categoriesData;

  final _i14.Key? key;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{categoriesData: $categoriesData, key: $key}';
  }
}

/// generated route for
/// [_i12.UpdateTags]
class UpdateTagsRoute extends _i13.PageRouteInfo<UpdateTagsRouteArgs> {
  UpdateTagsRoute({
    required _i10.Tag tagsData,
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         UpdateTagsRoute.name,
         args: UpdateTagsRouteArgs(tagsData: tagsData, key: key),
         initialChildren: children,
       );

  static const String name = 'UpdateTagsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTagsRouteArgs>();
      return _i12.UpdateTags(tagsData: args.tagsData, key: args.key);
    },
  );
}

class UpdateTagsRouteArgs {
  const UpdateTagsRouteArgs({required this.tagsData, this.key});

  final _i10.Tag tagsData;

  final _i14.Key? key;

  @override
  String toString() {
    return 'UpdateTagsRouteArgs{tagsData: $tagsData, key: $key}';
  }
}
