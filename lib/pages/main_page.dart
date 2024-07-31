import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zc_dodiddone/screens/all_tasks.dart';
import '../theme/theme.dart';
import 'package:zc_dodiddone/screens/profile.dart'; // Import ProfilePage

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TasksPage(),
    Text('Сегодня'),
    Text('Выполнено'),
    ProfilePage(), // Replace Text with ProfilePage
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Функция для показа диалога добавления задачи
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        DateTime deadline = DateTime.now();

        return AlertDialog(
          title: const Text('Добавить задачу'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Название задачи',
                ),
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Описание',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Открыть календарь для выбора дедлайна
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      deadline = selectedDate;
                      // Обновить состояние, чтобы отобразить выбранный дедлайн
                      setState(() {});
                    }
                  });
                },
                child: const Text('Выбрать дедлайн'),
              ),
              Text('Дедлайн: ${DateFormat('dd.MM.yy').format(deadline)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                // Добавить задачу в список (например, в Firestore)
                // ...
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow
        title: const Text('DoDidDone'),
        centerTitle: true,
      ),
      body: Container( // Add Container for gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, // Adjust gradient direction if needed
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
              DoDidDoneTheme.lightTheme.colorScheme.primary,
            ],
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
