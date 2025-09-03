// core/theme/theme_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_repository.dart';

class ThemeCubit extends Cubit<bool> {
  final ThemeRepository repository;

  ThemeCubit(this.repository) : super(false) {
    emit(repository.loadThemeMode());
  }

  void toggleTheme() {
    final newValue = !state;
    emit(newValue);
    repository.saveThemeMode(newValue);
  }
}
