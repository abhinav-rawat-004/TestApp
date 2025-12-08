import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  RxList todoItems = [].obs;
  RxList<bool> taskCompleted = <bool>[].obs;
  // RxInt todoItemCount = 0.obs;
  //RxInt deleteCount = 0.obs;

  TextEditingController addTaskController = TextEditingController();

  delete(int index) {
    todoItems.removeAt(index);
    taskCompleted.removeAt(index);
  }

  add() {
    if (addTaskController.text.isNotEmpty) {
      todoItems.add(addTaskController.text);
      taskCompleted.add(false);
      addTaskController.clear();
      //controller.todoItemCount.value++;
      Get.back();
    } else {
      Get.back();
    }
  }
  // deleteTask(int index) {
  //   if (deleteCount().isEqual(0)) {
  //     todoItems().removeAt(index);
  //   } else {
  //     todoItems().removeAt(
  //       index - deleteCount(),
  //     );
  //   }
  //   deleteCount.value++;
  //   todoItemCount.value--;
  // }

  // addTask() {
  //     if (controller.addTaskController().text.isNotEmpty) {
  //       controller.todoItems().add(
  //         controller.addTaskController().text,
  //       );
  //       controller.addTaskController().clear();
  //       controller.todoItemCount.value++;
  //       Get.back();
  //     } else {
  //       Get.back();
  //     }
  //   }
}
