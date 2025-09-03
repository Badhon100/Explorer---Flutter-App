import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const HomeSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, size: 20), // smaller icon
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.black12
              : AppColors.whiteF2,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10, // decrease vertical padding
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
