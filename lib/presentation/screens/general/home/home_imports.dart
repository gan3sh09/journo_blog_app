import 'dart:convert';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:journo_blog_app/data/repositories/repository.dart';
import 'package:journo_blog_app/presentation/common_widgets/common_widgets_imports.dart';
import 'package:journo_blog_app/presentation/router/router_imports.gr.dart';
import 'package:journo_blog_app/presentation/shimmer_effects/home_shimmer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/date_converter.dart';
import '../profile/profile_imports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'home.dart';
part 'home_model.dart';
part 'home_view_model.dart';
part 'home_details.dart';
