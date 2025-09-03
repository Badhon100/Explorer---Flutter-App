import 'package:explorer_flutter_app/core/theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Theme Cubit
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
