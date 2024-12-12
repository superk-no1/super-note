import 'package:flutter/material.dart';
import '../utils/constants.dart';

class BackButtonWithText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BackButtonWithText({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.accentColor,
              size: 18,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.accentColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
