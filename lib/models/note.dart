import 'package:intl/intl.dart' show DateFormat;
import '../utils/utils.dart';

class Note {

  String title;
  String text;
  final DateTime dateTime;
  bool locked = false;

  Note({required this.title, this.text = ''})
      : dateTime = DateTime.now();

  Note.timeAsTitle({this.text = ''})
      : title = DateFormat.Hm().format(DateTime.now()),
        dateTime = DateTime.now();

  Note.archived({required this.title, required this.text, required this.dateTime});

  factory Note.fromJson(Json json) {

    assert(json['title'] != null && json['text'] != null && json['dateTime'] != null);

    if (json case {'title': String title, 'text': String text, 'dateTime': String dtString}) {
      var dt = DateTime.parse(dtString);
      return Note.archived(title: title, text: text, dateTime: dt);
    } else {
      throw const FormatException("Invalid JSON format for Note");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other)
          || (other is Note)
          && (other.title == title)
          && (other.text == text)
          && (other.dateTime == dateTime)
          && (other.locked == locked);

  @override
  int get hashCode =>
      title.hashCode ^ text.hashCode ^ dateTime.hashCode ^ locked.hashCode;
}
