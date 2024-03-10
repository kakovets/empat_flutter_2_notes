typedef Json = Map<String, dynamic>;

enum NoteType {
  title,
  titleAndText,
  timeAsTitle,
  timeAsTitleText,
  fromJson,
}

Json json = {
  'title':'jsOn',
  'text' : 'Some cool note from json',
  'dateTime' : '2024-01-22T22:22:22',
};

void pinchOfSugar() {
  String? str;
  print((str as double) == 'v'.codeUnits[0].toRadixString(16)); // dumb cast --> Exception
  str = null;
  print(str?.toUpperCase()); // --> null
  str ??= 'I\'m not null!'; // --> str = 'I\'m not null!'
  str = null;
  print(str!.toLowerCase()); // also dumb cast --> Exception
  str = null;
  String notNullString = str ?? 'Null sucks!';
  print(notNullString); // --> Null sucks!
}