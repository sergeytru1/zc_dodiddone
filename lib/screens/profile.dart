import 'package:flutter/material.dart';
import 'package:zc_dodiddone/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  //late User? _user;
  bool isEmailVerified = false; // флаг проверки подтвержденной почты

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Аватар
            const CircleAvatar(
              radius: 50,
              backgroundImage:  AssetImage('assets/images/_1.png'),
            ),
            const SizedBox(height: 20),
            // Почта
            Text(
              //_user?.email ?? 'Неизвестно',
              'example@email.com', // замените на реальную почту
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
          // Кнопка подтверждения почты (отображается, если почта не подтверждена)
          if (!isEmailVerified)
            ElevatedButton(
              onPressed: () {
                // Обработка отправки запроса подтверждения почты
                // Например, можно показать диалог с сообщением о том, что письмо отправлено
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Подтверждение почты'),
                    content: const Text(
                        'Письмо с подтверждением отправлено на ваш адрес.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Подтвердить почту'),
            ),
          const SizedBox(height: 20),
          // Кнопка выхода из профиля
          ElevatedButton(
            onPressed: () {
              // Обработка выхода из профиля
              // Например, можно перейти на страницу входа
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Красный цвет для кнопки выхода
            ),
            child: const Text('Выйти'),
          ),

          ],
        ),
      ),
    );
  }
}
