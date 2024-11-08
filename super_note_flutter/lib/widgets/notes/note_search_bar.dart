import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class NoteSearchBar extends StatelessWidget {
  final Function(String)? onSearch;

  const NoteSearchBar({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.searchBarColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onSearch,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, size: 20),
          hintText: '搜索',
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          isDense: true,
        ),
      ),
    );
  }
}
