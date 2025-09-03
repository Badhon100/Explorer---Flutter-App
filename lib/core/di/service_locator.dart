// core/di/injection.dart
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_repository.dart';
import '../theme/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  // Theme
  sl.registerLazySingleton(() => ThemeRepository(sl()));
  sl.registerFactory(() => ThemeCubit(sl()));
}
