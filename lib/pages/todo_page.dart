import 'package:commmerce/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  TodoController get controller => Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ((controller.todoItems.isNotEmpty)
            ? ListView.builder(
                //Todo tasks list
                itemCount: controller.todoItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        controller.addTaskController.text =
                            controller.todoItems[index].task;
                        dialogBox(
                          controller.updateTodo,
                          true,
                          'Update',
                          index: index,
                        );
                      },
                      leading: Obx(
                        () => Checkbox(
                          value: controller.todoItems[index].checked,
                          onChanged: (value) {
                            controller.todoItems[index].checked =
                                value ?? false;
                            controller.updateTodo(controller.todoItems[index]);
                          },
                        ),
                      ),
                      title: Text(controller.todoItems[index].task),
                      trailing: IconButton(
                        // DELETE TASK BUTTON
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Confirm Delete',
                            titleStyle: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            titlePadding: EdgeInsets.only(top: 20),
                            middleText: 'Do you really want to delete this task?',
                            barrierDismissible: false,
                            cancel: MaterialButton(
                              // CANCEL BUTTON
                              onPressed: () {
                                controller.addTaskController.clear();
                                Get.back();
                              },
                              child: Text('cancel'),
                            ),
                            confirm: MaterialButton(
                              onPressed: () {
                                controller.delete(index);
                                Get.back();
                              },
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(
                                  6.0,
                                ),
                              ),
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
              )
            : Center(child: Text('No task added. Please add tasks'))),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => dialogBox(controller.add, false, 'Add'),
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  void dialogBox(Function function, bool update, String text, {int? index}) {
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20.0),
      title: '$text task',
      barrierDismissible: false,
      content: TextField(
        controller: controller.addTaskController,
        decoration: InputDecoration(
          hint: Text('Enter Task'),
          border: OutlineInputBorder(),
        ),
      ),
      confirm: MaterialButton(
        // ADD TASK BUTTON
        onPressed: () {
          if (update) {
            controller.todoItems[index!].task =
                controller.addTaskController.text;
            controller.updateTodo(controller.todoItems[index]);
          } else {
            function();
          }
        },
        color: const Color.fromARGB(255, 188, 121, 200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6.0),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
      cancel: MaterialButton(
        // CANCEL BUTTON
        onPressed: () {
          controller.addTaskController.clear();
          Get.back();
        },
        child: Text(
          'cancel',
          style: TextStyle(color: const Color.fromARGB(255, 188, 121, 200)),
        ),
      ),
    );
  }
}
