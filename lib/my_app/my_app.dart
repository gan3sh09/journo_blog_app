import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journo_blog_app/presentation/screens/general/home/home_imports.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import '../core/constants/app_strings.dart';
import '../core/themes/app_theme_imports.dart';
import '../l10n/l10n.dart';
import '../presentation/blocs/language_bloc/language_cubit.dart';
import '../presentation/router/router_imports.dart';
import '../presentation/screens/general/profile/profile_imports.dart';

class MyApp extends StatelessWidget {
  final LocaleCubit localeCubit;

  MyApp({required this.localeCubit, super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => VelocityBloc<ProfileModel>(ProfileModel()),
            ),
            BlocProvider(
                create: (_) => VelocityBloc<HomeModel>(HomeModel())),
          ],
          child: BlocProvider.value(
            value: localeCubit,
            child: BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                debugPrint(
                    "Current Locale in MaterialApp: //${locale.languageCode}");
                return FlavorBanner(
                  color: FlavorConfig.instance.variables['primaryColor'],
                  location: BannerLocation.bottomEnd,
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: AppStrings.appName,
                    theme: AppThemes.getLightTheme(locale),
                    darkTheme: AppThemes.getDarkTheme(locale),
                    themeMode: ThemeMode.system,
                    routerConfig: _appRouter.config(),
                    supportedLocales: L10n.all,
                    locale: locale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
