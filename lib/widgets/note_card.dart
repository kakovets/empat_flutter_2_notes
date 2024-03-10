import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: note.locked ? Colors.grey : const Color(0xFFFCDF96),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  color: note.locked
                      ? Colors.grey.shade600
                      : const Color(0xFFDB9E06)
              ),
              child: Center(
                child: Text(
                  note.title,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  note.text,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
      if (note.locked)
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.lock,
              color: Colors.black38,
            ),
          ),
        )
    ],
  );
}