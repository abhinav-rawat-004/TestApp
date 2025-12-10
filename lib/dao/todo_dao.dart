import 'package:commmerce/data/app_database.dart';
import 'package:commmerce/model/todo.dart';
import 'package:sembast/sembast.dart';

class TodoDao {
  //store name
  static final String TODO_STORE_NAME = 'todos';
  //
  final _todoStore = intMapStoreFactory.store(TODO_STORE_NAME);
  //Singleton instance of database
  Future<Database> get _db async => await AppDatabase.instance.database;
  //OPERATIONS

  //Insert
  Future insertTodo(Todo todo) async {
    await _todoStore.add(await _db, todo.toMap());
  }

  //Delete
  Future deleteTodo(Todo todo) async {
    final finder = Finder(filter: Filter.byKey(todo.id));
    await _todoStore.delete(await _db, finder: finder);
  }

  //Get
  Future<List<Todo>> getTodoList() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);
    final todoRecordSnapShot = await _todoStore.find(await _db, finder: finder);
    return todoRecordSnapShot.map((snapshot) {
      final todo = Todo.fromRecord(snapshot);
      todo.id = snapshot.key;
      return todo;
    }).toList();
  }

  Future updateTodo(Todo todo) async {
    final finder = Finder(filter: Filter.byKey(todo.id));
    await _todoStore.update(await _db,todo.toMap() , finder: finder);
  }
}
