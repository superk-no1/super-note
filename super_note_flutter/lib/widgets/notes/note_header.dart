import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class NoteHeader extends StatelessWidget {
  const NoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
      child: Text('备忘录', style: AppStyles.headerTextStyle),
    );
  }
}
