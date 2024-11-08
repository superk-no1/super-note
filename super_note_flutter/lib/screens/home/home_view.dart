import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/notes/note_header.dart';
import '../../widgets/notes/note_search_bar.dart';
import '../../utils/constants.dart';
import 'components/month_section.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final showTitleNotifier = ValueNotifier<bool>(false);

    scrollController.addListener(() {
      showTitleNotifier.value = scrollController.offset > 120;
    });

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          _buildSliverAppBar(showTitleNotifier),
          _buildMainView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.createNewNote(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSliverAppBar(ValueNotifier<bool> showTitleNotifier) {
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

  Widget _buildMainView() {
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 8),
        const NoteHeader(),
        NoteSearchBar(onSearch: controller.searchNotes),
        Obx(() {
          final groupedNotes = controller.groupedNotes;
          final sortedDates = groupedNotes.keys.toList()
            ..sort((a, b) => b.compareTo(a));

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sortedDates.map((date) {
              return MonthSection(
                date: date,
                notes: groupedNotes[date]!,
              );
            }).toList(),
          );
        }),
      ]),
    );
  }
}
