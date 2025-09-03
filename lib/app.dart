import 'package:explorer_flutter_app/core/di/service_locator.dart';
import 'package:explorer_flutter_app/core/theme/theme_cubit.dart';
import 'package:explorer_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: const HomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
