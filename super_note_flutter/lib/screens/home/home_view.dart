import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/notes/note_header.dart';
import '../../components/notes/note_search_bar.dart';
import '../../models/note_model.dart';
import '../../providers/notes/notes_provider.dart';
import '../../utils/constants.dart';
import 'components/month_section.dart';
import '../../providers/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final scrollController = ScrollController();
  final showTitleNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      showTitleNotifier.value = scrollController.offset > 120;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupedNotes = ref.watch(groupedNotesProvider);
    final notesNotifier = ref.watch(notesProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          _buildSliverAppBar(),
          _buildMainView(groupedNotes),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newNote = Note(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: '新笔记',
            content: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          notesNotifier.createNote(newNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 60,
      backgroundColor: AppColors.backgroundColor,
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.accentColor,
              ),
            ),
          ),
          const Text(
            '文件夹',
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
      leadingWidth: 100,
      titleSpacing: 0,
      title: ValueListenableBuilder<bool>(
        valueListenable: showTitleNotifier,
        builder: (context, showTitle, child) {
          return showTitle
              ? const Text(
                  '备忘录',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
            color: AppColors.accentColor,
          ),
        ),
      ],
    );
  }

  Widget _buildMainView(Map<DateTime, List<Note>> groupedNotes) {
    final notesNotifier = ref.watch(notesProvider.notifier);
    final sortedDates = groupedNotes.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 8),
        const NoteHeader(),
        NoteSearchBar(
          onSearch: (value) => notesNotifier.setSearchQuery(value),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sortedDates.map((date) {
            return MonthSection(
              date: date,
              notes: groupedNotes[date]!,
              onNoteTap: (note) {
                // TODO: 实现笔记详情页面后再添加导航
                // context.push(AppRoutes.noteDetailPath(note.id));
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}
