import 'package:explorer_flutter_app/core/di/bloc_providers.dart';
import 'package:explorer_flutter_app/core/theme/app_theme.dart';
import 'package:explorer_flutter_app/core/theme/theme_cubit.dart';
import 'package:explorer_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getAppBlocProviders(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
