import 'package:journo_blog_app/data/repositories/auth_repo.dart';
import 'package:journo_blog_app/data/repositories/category_repo.dart';
import 'package:journo_blog_app/data/repositories/posts_repo.dart';

import 'tags_repo.dart';

class Repository {
  Repository({
    required this.categoryRepo,
    required this.tagsRepo,
    required this.postsRepo,
    required this.authRepo,
  });

  final TagsRepo tagsRepo;
  final CategoryRepo categoryRepo;
  final PostsRepo postsRepo;
  final AuthRepo authRepo;
}
