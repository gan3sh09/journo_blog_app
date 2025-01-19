import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));

  Future<void> loadSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    debugPrint("Loaded language code: $languageCode");
    if (languageCode != null) {
      emit(Locale(languageCode));
    } else {
      emit(const Locale('en'));
    }
  }

  Future<void> changeLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    debugPrint("Locale changed to: $languageCode");
    emit(Locale(languageCode));
  }
}
