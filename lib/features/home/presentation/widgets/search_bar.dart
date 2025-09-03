import 'dart:async';
import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const HomeSearchBar({super.key, required this.onChanged});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController _controller = TextEditingController(
    text: 'Flutter',
  );
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onTextChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Start new debounce timer
    _debounce = Timer(const Duration(seconds: 1), () {
      widget.onChanged(query.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        onChanged: _onTextChanged, 
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
