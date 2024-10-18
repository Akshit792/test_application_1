import 'package:flutter/material.dart';
import 'package:test_application_1/models/task_model.dart';
import 'package:test_application_1/pages/add_edit_task_screen.dart';
import 'package:test_application_1/widgets/task_card.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "All List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AddEditTaskScreen(
                      addTask: addTask,
                    );
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: (tasks.isEmpty)
          ? const Center(
              child: Text(
                ("No Task Found...."),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final TaskModel task = tasks[index];

                return TaskCard(
                  task: task,
                  deleteTask: deleteTask,
                  completeTask: completeTask,
                );
              },
            ),
    );
  }

  void addTask({
    required TaskModel newTask,
  }) {
    tasks.add(newTask);

    setState(() {});
  }

  void completeTask({
    required TaskModel task,
  }) {
    int index = tasks.indexWhere((element) => element.id == task.id);

    if (index != -1) {
      tasks[index].isComplete = true;
    }

    setState(() {});
  }

  void deleteTask({
    required TaskModel task,
  }) {
    tasks.removeWhere((element) => element.id == task.id);

    setState(() {});
  }
}
