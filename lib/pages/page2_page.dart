import 'package:flutter/material.dart';
import 'package:status_app/models/user_model.dart';
import 'package:status_app/services/user_service.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream, 
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (!snapshot.hasData) {
              return const Text('No user');
            }
            return Text('Page 2 - ${snapshot.data!.name}');
          }
        ),
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
                userService.setUser(
                  User(
                    name: 'John', 
                    age: 30, 
                    professions: ['Software Engineer']
                  )
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
              onPressed: () => Navigator.pop(context),
              child: const Text('Add profession'),
            ),
          ],
        ),
      )
    );
  }
}