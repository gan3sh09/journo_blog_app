import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:journo_blog_app/presentation/shimmer_effects/tags_shimmer.dart';
import '../../../../data/repositories/tags_repo.dart';
import '../../../blocs/tags_bloc/tags_bloc.dart';
import '/presentation/common_widgets/common_widgets_imports.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/repositories/repository.dart';

part 'tags.dart';
part 'tags_model.dart';
part 'tags_view_model.dart';
