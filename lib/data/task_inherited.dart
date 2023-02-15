import 'package:flutter/cupertino.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
      title: 'Portuguese - Module I',
      path: 'assets/images/br.jpg',
      difficulty: 3,
    ),
    Task(
      title: 'English - Module I',
      path: 'assets/images/gb.jpg',
      difficulty: 1,
    ),
    Task(
      title: 'Spanish - Module I',
      path: 'assets/images/sp.jpg',
      difficulty: 3,
    ),
    Task(
      title: 'French - Module I',
      path: 'assets/images/fr.jpg',
      difficulty: 2,
    ),
    Task(
      title: 'Portuguese - Module VII',
      path: 'assets/images/br.jpg',
      difficulty: 4,
    ),
  ];

  void newTask({
    required String title,
    required int difficulty,
    required String path
  }) {
    taskList.add(Task(title: title, difficulty: difficulty, path: path));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
