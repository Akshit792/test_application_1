class TaskModel {
  final int id;
  String title;
  String description;
  bool isComplete;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete,
  });
}
