import 'package:flutter/material.dart';
import 'package:notes/providers/notes_provider.dart';
import 'package:notes/screens/note_screen.dart';
import 'package:notes/utils/utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => NotesProvider(),
        child: const NotesScreen(),
      ),
    ),
  );
}