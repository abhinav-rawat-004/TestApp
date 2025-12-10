import 'package:commmerce/dao/todo_dao.dart';
import 'package:commmerce/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  RxList<Todo> todoItems = <Todo>[].obs;
  // RxList<bool> taskCompleted = <bool>[].obs;
  final TodoDao dao = TodoDao();

  TextEditingController addTaskController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchTodo();
  }

  Future fetchTodo() async {
    todoItems.value = await dao.getTodoList();
  }

  void delete(int index) async {
    await dao.deleteTodo(todoItems[index]);
    fetchTodo();
    // todoItems.removeAt(index);
    //taskCompleted.removeAt(index);
  }

  Future updateTodo(Todo todo) async {
    await dao.updateTodo(todo);
    fetchTodo();
    Get.back();
    addTaskController.clear();
  }

  Future add() async {
    if (addTaskController.text.isNotEmpty) {
      //todoItems.add(addTaskController.text);
      Todo todo = Todo(task: addTaskController.text, checked: false);
      await dao.insertTodo(todo);
      //taskCompleted.add(false);
      addTaskController.clear();
      fetchTodo();
      //controller.todoItemCount.value++;
      Get.back();
    } else {
      Get.back();
    }
  }

  void addTodo() {}
}
