import 'package:sembast/sembast.dart';

class Todo {
  int? id;
  String task;
  bool checked;

  //constructor
  Todo({this.id, required this.task, required this.checked});

  // COnstructor Dart Object
  Map<String, dynamic> toMap() => {'task': task, 'checked': checked};

  //todo from sembast record snapshot
  static Todo fromRecord(RecordSnapshot<int, Map<String, dynamic>> record) {
    final map = record.value;
    return Todo(
      id: record.key,
      task: map['task'] as String,
      checked: map['checked'] as bool,
    );
  }
}
