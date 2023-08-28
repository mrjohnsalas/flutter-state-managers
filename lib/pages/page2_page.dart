import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_app/models/user_model.dart';
import 'package:status_app/services/user_service.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.existsUser
          ? Text(userService.user.name)
          : const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                userService.user = User(
                  name: 'John Doe',
                  age: 30,
                  professions: ['Software Engineer']
                );
              },
              child: const Text('Set user'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                userService.changeAge(31);
              },
              child: const Text('Change age'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                userService.addProfession('Doctor');
              },
              child: const Text('Add profession'),
            ),
          ],
        ),
      )
    );
  }
}