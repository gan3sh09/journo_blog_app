import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:journo_blog_app/data/repositories/auth_repo.dart';
import 'package:journo_blog_app/data/repositories/category_repo.dart';
import 'package:journo_blog_app/data/repositories/posts_repo.dart';
import 'package:journo_blog_app/data/repositories/repository.dart';
import 'package:journo_blog_app/data/repositories/tags_repo.dart';

import 'my_app/my_app.dart';
import 'presentation/blocs/language_bloc/language_cubit.dart';

void main() async {
  FlavorConfig(
    name: "PROD",
    variables: {
      "primaryColor": Colors.deepPurple,
      "mainUrl": "https://techblog.codersangam.com/api/",
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  final localeCubit = LocaleCubit();
  await localeCubit.loadSavedLocale();
  runApp(
    RepositoryProvider(
      create: (context) => Repository(
        authRepo: AuthRepo(),
        tagsRepo: TagsRepo(),
        categoryRepo: CategoryRepo(),
        postsRepo: PostsRepo(),
      ),
      child: MyApp(
        localeCubit: localeCubit,
      ),
    ),
  );
}
