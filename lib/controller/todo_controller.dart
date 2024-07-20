import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = <String>[].obs;
  final TextEditingController todoController = TextEditingController();
  var editingIndex = (-1).obs;

  void addTodo() {
    if (todoController.text.isNotEmpty) {
      if (editingIndex.value == -1) {
        todos.add(todoController.text);
      } else {
        todos[editingIndex.value] = todoController.text;
        editingIndex.value = -1;
      }
      todoController.clear();
    }
  }

  void editTodoItem(int index) {
    todoController.text = todos[index];
    editingIndex.value = index;
  }

  void updateTodo() {
    if (todoController.text.isNotEmpty && editingIndex.value != -1) {
      todos[editingIndex.value] = todoController.text;
      editingIndex.value = -1;
      todoController.clear();
    }
  }

  void deleteTodoItem(int index) {
    todos.removeAt(index);
    if (editingIndex.value == index) {
      editingIndex.value = -1;
      todoController.clear();
    }
  }

  @override
  void onClose() {
    todoController.dispose();
    super.onClose();
  }
}
