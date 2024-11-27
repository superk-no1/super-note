import '../models/note_model.dart';

abstract class StorageService {
  Future<List<Note>> getNotes();
  Future<void> saveNote(Note note);
  Future<void> deleteNote(String id);
  Future<void> updateNote(Note note);
}

class LocalStorageService implements StorageService {
  @override
  Future<List<Note>> getNotes() async {
    // TODO: 实现本地存储
    return [];
  }

  @override
  Future<void> saveNote(Note note) async {
    // TODO: 实现保存笔记
  }

  @override
  Future<void> deleteNote(String id) async {
    // TODO: 实现删除笔记
  }

  @override
  Future<void> updateNote(Note note) async {
    // TODO: 实现更新笔记
  }
}
