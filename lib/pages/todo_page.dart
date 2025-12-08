
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
                      leading: Obx(
                      () => Checkbox(
                          value: controller.taskCompleted[index], 
                          onChanged: (value) {
                            controller.taskCompleted[index] = value ?? false;
                          },
                        ),
                      ),
                      title: Text(
                        controller.todoItems[index],
                        
                      ),
                      trailing: IconButton(
                        // DELETE TASK BUTTON
                        onPressed: () {
                          controller.delete(index);
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
        onPressed: () {
          Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 20.0),
            title: 'Add new task',
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
                controller.add();
              },
              color: const Color.fromARGB(255, 188, 121, 200),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(6.0),
              ),
              child: Text('Add', style: TextStyle(color: Colors.white)),
            ),
            cancel: MaterialButton(
              // CANCEL BUTTON
              onPressed: () {
                controller.addTaskController.clear();
                Get.back();
              },
              child: Text(
                'cancel',
                style: TextStyle(
                  color: const Color.fromARGB(255, 188, 121, 200),
                ),
              ),
            ),
          );
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
