import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:explorer_flutter_app/core/theme/app_colors.dart';

class RepositoryCardSkeleton extends StatelessWidget {
  const RepositoryCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black12
          : AppColors.whiteF2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black00
          : AppColors.whiteFF,
          highlightColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black12
          : AppColors.whiteF2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16,
                width: double.infinity,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(height: 14, width: 100, color: Colors.white),
              const SizedBox(height: 8),
              Container(
                height: 12,
                width: double.infinity,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
