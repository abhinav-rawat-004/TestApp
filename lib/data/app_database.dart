import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  //singleton instance
  static final AppDatabase _singleton = AppDatabase._();
  //private constructor
  AppDatabase._();
  //singleton accessor
  static AppDatabase get instance => _singleton;
  //
  Completer<Database>? _dbOpenCompleter;
  //
  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      await _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    //os specific directory
    final dir = await  getApplicationDocumentsDirectory();
    //db path
    final dbPath = join(dir.path, 'app.db');
    //openDatabase
    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter!.complete(database);
  }
}
