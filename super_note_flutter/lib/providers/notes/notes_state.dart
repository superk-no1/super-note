import '../../models/note_model.dart';

class NotesState {
  final List<Note> notes;
  final bool isLoading;
  final String? error;
  final String searchQuery;

  NotesState({
    this.notes = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
  });

  NotesState copyWith({
    List<Note>? notes,
    bool? isLoading,
    String? error,
    String? searchQuery,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
