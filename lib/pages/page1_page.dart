import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_app/models/user_model.dart';
import 'package:status_app/services/user_service.dart';

class Page1 extends StatelessWidget {

  const Page1({super.key});

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          if (userService.existsUser)
            IconButton(
              onPressed: () => userService.removeUser(),
              icon: const Icon(Icons.delete_forever)
            )
        ],
      ),
      body: userService.existsUser 
        ? _UserInfo(user: userService.user)
        : const Center(child: Text('No user selected')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {

  final User user;

  const _UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          const Text('Profession', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          const ListTile(title: Text('Profession: ')),
          ...user.professions.map((profession) => ListTile(title: Text(profession))).toList(),
        ],
      )
    );
  }
}