import 'package:flutter/material.dart';
import '../../../components/notes/note_list_item.dart';
import '../../../models/note_model.dart';
import '../../../utils/date_formatter.dart';
import '../../../utils/constants.dart';

class MonthSection extends StatelessWidget {
  final DateTime date;
  final List<Note> notes;
  final Function(Note)? onNoteTap;

  const MonthSection({
    super.key,
    required this.date,
    required this.notes,
    this.onNoteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text(
            DateFormatter.formatMonthHeader(date),
            style: AppStyles.monthHeaderStyle,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: notes.length,
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) => NoteListItem(
              note: notes[index],
              onTap: () => onNoteTap?.call(notes[index]),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
