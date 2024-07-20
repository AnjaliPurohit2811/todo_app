import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/todo_controller.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D7EF),
      appBar: AppBar(
        backgroundColor: Color(0xff9395D3),
        title: Text(
          'TODO APP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Icon(
            CupertinoIcons.calendar,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: Container(
              height: 80,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: todoController.todoController,
                      decoration: InputDecoration(
                        hintText: 'Enter TODO title',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: todoController.addTodo,
                    icon: Icon(
                      Icons.check,
                      color: Color(0xff9395D3),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              todoController.todos[index],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              todoController.editTodoItem(index);
                            },
                            icon: Icon(
                              Icons.mode_edit_outline_outlined,
                              color: Color(0xffD6D7EF),
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () => todoController.deleteTodoItem(index),
                            icon: Icon(
                              Icons.delete_outline,
                              color: Color(0xffD6D7EF),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),

    );
  }
}
