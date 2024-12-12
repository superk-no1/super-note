import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import '../models/note.dart';
import '../screens/home/home_view.dart';
import '../pages/note_edit_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/edit/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return FutureBuilder<List<Note>>(
            future: storageService.getNotes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final notes = snapshot.data!;
              final note = id != null
                  ? notes.firstWhere(
                      (note) => note.id == id,
                      orElse: () => Note(
                        id: id,
                        content: '',
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      ),
                    )
                  : null;

              return NoteEditPage(
                note: note,
                storageService: storageService,
                onSave: (note) async {
                  final currentNotes = await storageService.getNotes();
                  final index = currentNotes.indexWhere((n) => n.id == note.id);
                  if (index != -1) {
                    currentNotes[index] = note;
                  } else {
                    currentNotes.insert(0, note);
                  }
                  await storageService.saveNotes(currentNotes);
                },
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/edit',
        builder: (context, state) => NoteEditPage(
          storageService: storageService,
          onSave: (note) async {
            final notes = await storageService.getNotes();
            notes.insert(0, note);
            await storageService.saveNotes(notes);
          },
        ),
      ),
    ],
  );
});
