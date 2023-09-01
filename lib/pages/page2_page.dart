import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_app/controllers/user_controller.dart';
import 'package:status_app/models/user_model.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
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
                userController.setUser(User(name: 'John', age: 35, professions: ['Developer', 'Designer']));
                Get.snackbar(
                  'Set user', 
                  'John is set as user',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white
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
                userController.changeAge(40);
              },
              child: const Text('Change age'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                userController.addProfession('Engineer');
              },
              child: const Text('Add profession'),
            ),
          ],
        ),
      )
    );
  }
}