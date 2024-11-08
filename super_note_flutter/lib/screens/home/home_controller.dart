import 'package:get/get.dart';
import 'package:collection/collection.dart';
import '../../models/note_model.dart';

class HomeController extends GetxController {
  final RxList<Note> notes = <Note>[].obs;

  // 按月份分组的笔记
  Map<DateTime, List<Note>> get groupedNotes {
    return groupBy(notes, (Note note) {
      return DateTime(note.createdAt.year, note.createdAt.month);
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  void loadNotes() {
    // 模拟一些测试数据
    notes.addAll([
      Note(
        id: '1',
        title: '测试笔记1',
        content: '这是一条测试内容',
        createdAt: DateTime(2024, 3, 20),
        updatedAt: DateTime(2024, 3, 20),
      ),
      Note(
        id: '2',
        title: '测试笔记2',
        content: '这是另一条测试内容',
        createdAt: DateTime(2024, 3, 15),
        updatedAt: DateTime(2024, 3, 15),
      ),
      Note(
        id: '3',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
      Note(
        id: '4',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
      Note(
        id: '5',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
      Note(
        id: '6',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
      Note(
        id: '7',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
      Note(
        id: '8',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
      Note(
        id: '9',
        title: '旧笔记',
        content: '上个月的笔记',
        createdAt: DateTime(2024, 2, 25),
        updatedAt: DateTime(2024, 2, 25),
      ),
    ]);
  }

  void createNewNote() {
    // TODO: 实现创建新笔记的逻辑
  }

  void searchNotes(String keyword) {
    // TODO: 实现搜索笔记的逻辑
  }
}
