import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/models/note.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../utils/utils.dart';
import '../widgets/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  late Function dashSaid;

  @override
  void initState() {
    super.initState();
    dashSaid = closure('Dash said');
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0, 0.5, 1],
        colors: [
          Color(0xFFCBABFF),
          Color(0xFF96B3FC),
          Color(0xFFA6F4FF),
        ],
      ),
    ),
    child: Consumer<NotesProvider>(
      builder: (context, notesProvider, _) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: GestureDetector(
                child: const Text('Empat Notes'),
                onTap: () {
                  SnackBar snackBar = SnackBar(
                    padding: const EdgeInsets.all(20),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    content: Text(dashSaid(notesProvider.noteList.last.text)),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              backgroundColor: Colors.transparent,
              actions: [
                PopupMenuButton<NoteType>(
                  icon: const Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onSelected: (selected) {
                    notesProvider.add(
                        switch (selected) {
                          NoteType.title => Note(title: 'title'),
                          NoteType.titleAndText => Note(title: 'title', text: 'text'),
                          NoteType.timeAsTitle => Note.timeAsTitle(),
                          NoteType.timeAsTitleText => Note.timeAsTitle(text: 'text'),
                          NoteType.fromJson => Note.fromJson(json),
                        }
                    );
                  },
                  itemBuilder: (context) => NoteType.values.map((type) => PopupMenuItem<NoteType>(
                    value: type,
                    child: Text(type.name.substring(0, 1).toUpperCase() + type.name.substring(1)),
                  )).toList(),
                ),
                IconButton(
                    icon: const Icon(Icons.file_download_outlined),
                    onPressed: notesProvider.addMany
                ),
                IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: notesProvider.clearNotes
                ),
              ],
            ),
            body:
            notesProvider.noteList.isEmpty
                ?
            const Center(
              child: Text('There is no notes yet'),
            )
                :
            GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: notesProvider.noteList.map((note) => GestureDetector(
                child: NoteCard(note: note,),
                onTap: () => note.locked ? null : Fluttertoast.showToast(msg: 'Tap!'),
                onLongPress: () {
                  notesProvider
                    ..setTitle(note, note.locked ? 'kek' : 'lol')
                    ..setText(note, 'It seems you ${note.locked ? 'un' : ''}locked the note!')
                    ..setIsLocked(note, !note.locked);
                },
              )).toList(),
            )
        );
      },
    ),
  );

  Function closure(String text) {
    return (String tt) => '$text: $tt';
  }
}