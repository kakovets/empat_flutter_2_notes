import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {

  List<Note> _noteList = [];
  List<Note> get noteList => _noteList;
  set noteList(List<Note> value) {
    _noteList = value;
    notifyListeners();
  }

  void add(Note note) {
    _noteList.add(note);
    notifyListeners();
  }

  void addMany() {
    for (int i = 1; i <= 20; i++ ) {
      var note = Note(title: '$i');
      note.locked = (math.Random().nextInt(2) + 1) % 2 == 0;
      note.text = math.Random().nextInt(10) % 2 == 0
          ? lorem(paragraphs: 1, words: 10)
          : lorem(paragraphs: 2, words: 24);
      _noteList.add(note);
    }
    notifyListeners();
  }

  void remove(Note note) {
    _noteList.remove(note);
    notifyListeners();
  }

  void clearNotes() {
    _noteList.clear();
    notifyListeners();
  }


  List<Note> onlyWithEvenHash() =>
      noteList.where((note) => note.hashCode % 2 == 0).toList();

  Set<Note> toUniqueNotes() => {...noteList};

  void setTitle(Note note, String newTitle) {
    note.title = newTitle;
    notifyListeners();
  }

  void setText(Note note, String newText) {
    note.text = newText;
    notifyListeners();
  }

  void setIsLocked(Note note, bool newIsLocked) {
    note.locked = newIsLocked;
    notifyListeners();
  }

}
