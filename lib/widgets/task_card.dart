import 'package:flutter/material.dart';
import 'package:test_application_1/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final void Function({required TaskModel task}) deleteTask;
  final void Function({required TaskModel task}) completeTask;
  final TaskModel task;

  const TaskCard({
    required this.task,
    required this.deleteTask,
    required this.completeTask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    deleteTask(task: task);
                  },
                  icon: const Icon(Icons.delete_outline),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.description,
                ),
                Checkbox(
                  value: task.isComplete,
                  onChanged: (value) {
                    completeTask(task: task);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
