import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:journo_blog_app/presentation/common_widgets/common_widgets_imports.dart';
import 'package:journo_blog_app/presentation/screens/general/profile/profile_imports.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/size_config.dart';
import '../../../../../data/repositories/repository.dart';
import '../../../../enums/navigate_type.dart';
import '../../../../router/router_imports.gr.dart';
import '../../category/category_model.dart';
import '../../tags/tags_imports.dart';


part 'update_mypost.dart';
part 'update_mypost_model.dart';
part 'update_mypost_view_model.dart';
