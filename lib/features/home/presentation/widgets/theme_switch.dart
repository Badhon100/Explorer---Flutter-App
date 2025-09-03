// features/home/presentation/widgets/theme_switch.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/theme_cubit.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return Switch(
          value: isDark,
          onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
        );
      },
    );
  }
}
