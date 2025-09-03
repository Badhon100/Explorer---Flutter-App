import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const HomeSearchBar({super.key, required this.onChanged});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  // Only initialize once here
  final TextEditingController _controller = TextEditingController(
    text: 'Flutter',
  );

  @override
  void initState() {
    super.initState();

    // Trigger the onChanged callback with default value once when widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller, // ✅ Important!
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, size: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.black12
              : AppColors.whiteF2,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
