import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.lightTheme);

  void toggleTheme() {
    emit(
      state.brightness == Brightness.light
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
    );
  }
}
