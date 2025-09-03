import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  final String name;
  final String username;
  final String description;
  final int stars;

  const RepositoryCard({
    super.key,
    required this.name,
    required this.username,
    required this.description,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black12 // dark mode card
          : AppColors.whiteF2, 
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: t16b700(
                    name,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16),
                    const SizedBox(width: 4),
                    t14b500(stars.toString()),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            t14b600(username,),
            const SizedBox(height: 8),
            t12b500ml3(description),
          ],
        ),
      ),
    );
  }
}
