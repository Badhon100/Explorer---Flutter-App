import 'package:explorer_flutter_app/core/di/service_locator.dart';
import 'package:explorer_flutter_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/theme_cubit.dart';

/// Returns a list of all BlocProviders used in the app
List<BlocProvider> getAppBlocProviders() {
  return [
    BlocProvider<ThemeCubit>(create: (_) => sl<ThemeCubit>()),
    BlocProvider<HomeBloc>(create: (_) => sl<HomeBloc>()),
    // Add more BLoCs here if needed in the future
  ];
}
