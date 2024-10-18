import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_application_1/models/task_model.dart';

class AddEditTaskScreen extends StatefulWidget {
  final void Function({required TaskModel newTask}) addTask;

  const AddEditTaskScreen({
    required this.addTask,
    super.key,
  });

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  bool isInit = false;
  late TaskModel task;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      final args = ModalRoute.of(context)?.settings.arguments;

      if (args == null) {
        task = TaskModel(
          id: Random().nextInt(9000),
          title: "",
          description: "",
          isComplete: false,
        );
      }

      isInit = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.addTask(
                newTask: task,
              );

              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              onChanged: (title) {
                task.title = title;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              onChanged: (description) {
                task.description = description;
              },
            ),
          ],
        ),
      ),
    );
  }
}
