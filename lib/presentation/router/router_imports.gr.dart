// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i17;
import 'package:journo_blog_app/presentation/enums/navigate_type.dart' as _i18;
import 'package:journo_blog_app/presentation/screens/auth/auth_imports.dart'
    as _i3;
import 'package:journo_blog_app/presentation/screens/auth/login/login_imports.dart'
    as _i7;
import 'package:journo_blog_app/presentation/screens/auth/register/register_imports.dart'
    as _i10;
import 'package:journo_blog_app/presentation/screens/general/category/add_category/add_category_import.dart'
    as _i1;
import 'package:journo_blog_app/presentation/screens/general/category/category_imports.dart'
    as _i4;
import 'package:journo_blog_app/presentation/screens/general/category/category_model.dart'
    as _i19;
import 'package:journo_blog_app/presentation/screens/general/category/update_category/update_category_import.dart'
    as _i13;
import 'package:journo_blog_app/presentation/screens/general/general_imports.dart'
    as _i5;
import 'package:journo_blog_app/presentation/screens/general/home/home_imports.dart'
    as _i6;
import 'package:journo_blog_app/presentation/screens/general/profile/profile_imports.dart'
    as _i9;
import 'package:journo_blog_app/presentation/screens/general/profile/update_mypost/update_mypost_imports.dart'
    as _i14;
import 'package:journo_blog_app/presentation/screens/general/tags/add_tags/add_tags_import.dart'
    as _i2;
import 'package:journo_blog_app/presentation/screens/general/tags/tags_imports.dart'
    as _i12;
import 'package:journo_blog_app/presentation/screens/general/tags/update_tags/update_tags_import.dart'
    as _i15;
import 'package:journo_blog_app/presentation/screens/onboarding_screen/onboarding_imports.dart'
    as _i8;
import 'package:journo_blog_app/presentation/screens/splash_screen/splash_imports.dart'
    as _i11;

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i16.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i16.PageRouteInfo>? children})
    : super(AddCategoryRoute.name, initialChildren: children);

  static const String name = 'AddCategoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCategory();
    },
  );
}

/// generated route for
/// [_i2.AddTags]
class AddTagsRoute extends _i16.PageRouteInfo<void> {
  const AddTagsRoute({List<_i16.PageRouteInfo>? children})
    : super(AddTagsRoute.name, initialChildren: children);

  static const String name = 'AddTagsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddTags();
    },
  );
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute({List<_i16.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.Auth();
    },
  );
}

/// generated route for
/// [_i4.Categories]
class CategoriesRoute extends _i16.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i17.Key? key,
    required _i18.NavigateType navigateType,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         CategoriesRoute.name,
         args: CategoriesRouteArgs(key: key, navigateType: navigateType),
         initialChildren: children,
       );

  static const String name = 'CategoriesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>();
      return _i4.Categories(key: args.key, navigateType: args.navigateType);
    },
  );
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({this.key, required this.navigateType});

  final _i17.Key? key;

  final _i18.NavigateType navigateType;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, navigateType: $navigateType}';
  }
}

/// generated route for
/// [_i5.General]
class GeneralRoute extends _i16.PageRouteInfo<void> {
  const GeneralRoute({List<_i16.PageRouteInfo>? children})
    : super(GeneralRoute.name, initialChildren: children);

  static const String name = 'GeneralRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.General();
    },
  );
}

/// generated route for
/// [_i6.HomeDetails]
class HomeDetailsRoute extends _i16.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i17.Key? key,
    required _i6.Post latestPosts,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         HomeDetailsRoute.name,
         args: HomeDetailsRouteArgs(key: key, latestPosts: latestPosts),
         initialChildren: children,
       );

  static const String name = 'HomeDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDetailsRouteArgs>();
      return _i6.HomeDetails(key: args.key, latestPosts: args.latestPosts);
    },
  );
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({this.key, required this.latestPosts});

  final _i17.Key? key;

  final _i6.Post latestPosts;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, latestPosts: $latestPosts}';
  }
}

/// generated route for
/// [_i7.Login]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.Login();
    },
  );
}

/// generated route for
/// [_i8.OnboardingScreen]
class OnboardingScreenRoute extends _i16.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i16.PageRouteInfo>? children})
    : super(OnboardingScreenRoute.name, initialChildren: children);

  static const String name = 'OnboardingScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i9.Profile]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.Profile();
    },
  );
}

/// generated route for
/// [_i10.Register]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.Register();
    },
  );
}

/// generated route for
/// [_i11.SplashScreen]
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i16.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}

/// generated route for
/// [_i12.Tags]
class TagsRoute extends _i16.PageRouteInfo<TagsRouteArgs> {
  TagsRoute({
    _i17.Key? key,
    required _i18.NavigateType navigateType,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         TagsRoute.name,
         args: TagsRouteArgs(key: key, navigateType: navigateType),
         initialChildren: children,
       );

  static const String name = 'TagsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TagsRouteArgs>();
      return _i12.Tags(key: args.key, navigateType: args.navigateType);
    },
  );
}

class TagsRouteArgs {
  const TagsRouteArgs({this.key, required this.navigateType});

  final _i17.Key? key;

  final _i18.NavigateType navigateType;

  @override
  String toString() {
    return 'TagsRouteArgs{key: $key, navigateType: $navigateType}';
  }
}

/// generated route for
/// [_i13.UpdateCategory]
class UpdateCategoryRoute extends _i16.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    required _i19.Category categoriesData,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         UpdateCategoryRoute.name,
         args: UpdateCategoryRouteArgs(
           categoriesData: categoriesData,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'UpdateCategoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateCategoryRouteArgs>();
      return _i13.UpdateCategory(
        categoriesData: args.categoriesData,
        key: args.key,
      );
    },
  );
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({required this.categoriesData, this.key});

  final _i19.Category categoriesData;

  final _i17.Key? key;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{categoriesData: $categoriesData, key: $key}';
  }
}

/// generated route for
/// [_i14.UpdateMypost]
class UpdateMypostRoute extends _i16.PageRouteInfo<UpdateMypostRouteArgs> {
  UpdateMypostRoute({
    required _i9.UserDetails userData,
    required _i9.Post userPostsData,
    required int index,
    _i20.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         UpdateMypostRoute.name,
         args: UpdateMypostRouteArgs(
           userData: userData,
           userPostsData: userPostsData,
           index: index,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'UpdateMypostRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateMypostRouteArgs>();
      return _i14.UpdateMypost(
        userData: args.userData,
        userPostsData: args.userPostsData,
        index: args.index,
        key: args.key,
      );
    },
  );
}

class UpdateMypostRouteArgs {
  const UpdateMypostRouteArgs({
    required this.userData,
    required this.userPostsData,
    required this.index,
    this.key,
  });

  final _i9.UserDetails userData;

  final _i9.Post userPostsData;

  final int index;

  final _i20.Key? key;

  @override
  String toString() {
    return 'UpdateMypostRouteArgs{userData: $userData, userPostsData: $userPostsData, index: $index, key: $key}';
  }
}

/// generated route for
/// [_i15.UpdateTags]
class UpdateTagsRoute extends _i16.PageRouteInfo<UpdateTagsRouteArgs> {
  UpdateTagsRoute({
    required _i12.Tag tagsData,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         UpdateTagsRoute.name,
         args: UpdateTagsRouteArgs(tagsData: tagsData, key: key),
         initialChildren: children,
       );

  static const String name = 'UpdateTagsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTagsRouteArgs>();
      return _i15.UpdateTags(tagsData: args.tagsData, key: args.key);
    },
  );
}

class UpdateTagsRouteArgs {
  const UpdateTagsRouteArgs({required this.tagsData, this.key});

  final _i12.Tag tagsData;

  final _i17.Key? key;

  @override
  String toString() {
    return 'UpdateTagsRouteArgs{tagsData: $tagsData, key: $key}';
  }
}
