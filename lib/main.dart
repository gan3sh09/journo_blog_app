import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journo_blog_app/data/repositories/auth_repo.dart';
import 'package:journo_blog_app/data/repositories/category_repo.dart';
import 'package:journo_blog_app/data/repositories/posts_repo.dart';
import 'package:journo_blog_app/data/repositories/repository.dart';
import 'package:journo_blog_app/data/repositories/tags_repo.dart';
import 'core/constants/app_strings.dart';
import 'core/themes/app_theme_imports.dart';
import 'presentation/router/router_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(
    RepositoryProvider(
      create: (context) => Repository(
        authRepo: AuthRepo(),
        tagsRepo: TagsRepo(),
        categoryRepo: CategoryRepo(),
        postsRepo: PostsRepo(),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
