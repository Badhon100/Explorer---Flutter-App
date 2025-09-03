import 'package:explorer_flutter_app/core/const/functions.dart';
import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:explorer_flutter_app/features/home/presentation/widgets/theme_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepositoryDetailsPage extends StatelessWidget {
  const RepositoryDetailsPage({
    super.key,
    required this.name,
    required this.username,
    required this.description,
    required this.stars,
    required this.forks,
    required this.avatarUrl,
    required this.repoUrl,
  });
  final String name;
  final String username;
  final String description;
  final int stars;
  final int forks;
  final String avatarUrl;
  final String repoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: t18b800('Details'),
        actions: const [ThemeSwitch()],
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back))
      ),
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
                    t12b500(forks.toString()),
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
                        SizedBox(
                          width:
                              200, // or MediaQuery.of(context).size.width * 0.5
                          child: Text(
                            repoUrl,
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.whiteFF
                                  : AppColors.black00,
                              decoration: TextDecoration.underline,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
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
              description.isNotEmpty ? description : 'No description provided.',
            ),
          ],
        ),
      ),
    );
  }
}
