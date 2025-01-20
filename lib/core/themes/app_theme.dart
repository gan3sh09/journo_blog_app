part of 'app_theme_imports.dart';

class AppThemes {
  AppThemes._();

  static ThemeData getLightTheme(Locale locale) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      fontFamily: locale.languageCode == 'ne'
          ? GoogleFonts.roboto().fontFamily
          : GoogleFonts.poppins().fontFamily,
      textTheme: TextThemes.lightTheme,
      scaffoldBackgroundColor: AppColors.scafLightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: false,
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

  static ThemeData getDarkTheme(Locale locale) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      fontFamily: locale.languageCode == 'ne'
          ? GoogleFonts.roboto().fontFamily
          : GoogleFonts.poppins().fontFamily,
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
}
