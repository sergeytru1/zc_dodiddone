import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<String> _tasks = [
    'Купить продукты',
    'Записаться на тренировку',
    'Отправить отчет',
    'Позвонить другу',
    'Сделать уборку',
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index]),
            trailing: const Icon(Icons.check_circle), // Add a checkmark icon
          );
        },
      );
  }
}
