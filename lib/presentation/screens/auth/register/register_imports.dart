import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:journo_blog_app/utils/validations.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import '../../../../data/repositories/repository.dart';
import '/presentation/router/router_imports.gr.dart';
import '/presentation/screens/auth/login/widgets/widgets_import.dart';
import '/presentation/common_widgets/common_widgets_imports.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'register.dart';
part 'register_model.dart';
part 'register_view_model.dart';
