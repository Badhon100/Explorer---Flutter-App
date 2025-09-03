import 'package:explorer_flutter_app/core/const/functions.dart';
import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:explorer_flutter_app/features/home/presentation/widgets/theme_switch.dart';
import 'package:flutter/material.dart';

class RepositoryDetailsPage extends StatelessWidget {
  const RepositoryDetailsPage({
    super.key,
    required this.name,
    required this.username,
    required this.description,
    required this.stars,
    // required this.forks,
    required this.avatarUrl,
    required this.repoUrl,
  });
  final String name;
  final String username;
  final String description;
  final int stars;
  // final int forks;
  final String avatarUrl;
  final String repoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: t18b800('Details'), actions: const [ThemeSwitch()]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                t16b700(name),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 18),
                    sW4(),
                    t12b500(stars.toString()),
                    sW16(),
                    Icon(Icons.call_split, size: 18),
                    sW4(),
                    t12b500('4'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors
                          .black12 // dark mode card
                    : AppColors.whiteF2,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                      avatarUrl, // Replace with actual image
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    username,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors
                                .whiteFF // dark mode card
                          : AppColors.black00,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => launchURL(repoUrl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.link, size: 16, color: Colors.white70),
                        SizedBox(width: 4),
                        Text(
                          repoUrl,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors
                                      .whiteFF // dark mode card
                                : AppColors.black00,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            t14b500(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            ),
          ],
        ),
      ),
    );
  }
}
