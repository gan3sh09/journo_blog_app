import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:journo_blog_app/presentation/enums/navigate_type.dart';
import 'package:journo_blog_app/presentation/router/router_imports.gr.dart';
import 'package:journo_blog_app/presentation/shimmer_effects/tags_shimmer.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import '/presentation/common_widgets/common_widgets_imports.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/repositories/repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'tags.dart';
part 'tags_model.dart';
part 'tags_view_model.dart';
