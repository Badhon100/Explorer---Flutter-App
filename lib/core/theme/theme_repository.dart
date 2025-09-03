// core/theme/theme_repository.dart
import 'package:explorer_flutter_app/core/storage/storage_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  final SharedPreferences prefs;

  ThemeRepository(this.prefs);

  static const _light = 'light';
  static const _dark = 'dark';

  Future<void> saveThemeMode(bool isDark) async {
    await prefs.setString(StorageKeys.themeMode, isDark ? _dark : _light);
  }

  bool loadThemeMode() {
    final theme = prefs.getString(StorageKeys.themeMode);
    return theme == _dark; // default is light
  }
}
