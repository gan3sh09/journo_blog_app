part of 'app_theme_imports.dart';

class AppThemes {
  AppThemes._();
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextThemes.lightTheme,
    scaffoldBackgroundColor: AppColors.scafLightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 20,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 20,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextThemes.darkTheme,
    scaffoldBackgroundColor: AppColors.scafLightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 20,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 20,
      ),
    ),
  );
}
