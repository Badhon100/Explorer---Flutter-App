import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:explorer_flutter_app/core/theme/theme_cubit.dart';
import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return Row(
          children: [
            t14b500("Dark mode"),
            Transform.scale(
              scale: 0.8, // decrease overall size (height & width)
              child: Switch(
                value: isDark,
                inactiveThumbColor: AppColors.grey99,
                inactiveTrackColor: AppColors.greyE8,
                activeTrackColor: AppColors.green4D,
                activeColor: AppColors.whiteF2,
                onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
              ),
            ),
          ],
        );
      },
    );
  }
}
