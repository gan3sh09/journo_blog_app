import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:journo_blog_app/core/constants/app_colors.dart';
import 'package:journo_blog_app/core/constants/size_config.dart';
import 'package:journo_blog_app/data/repositories/repository.dart';
import 'package:journo_blog_app/presentation/common_widgets/common_widgets_imports.dart';
import 'package:journo_blog_app/presentation/router/router_imports.gr.dart';
import 'package:journo_blog_app/utils/utils.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../common_widgets/date_converter.dart';
import '../../../shimmer_effects/profile_shimmer.dart';
part 'profile.dart';
part 'profile_model.dart';
part 'profile_view_model.dart';
