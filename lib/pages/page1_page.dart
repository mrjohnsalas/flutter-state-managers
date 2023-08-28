import 'package:flutter/material.dart';
import 'package:status_app/models/user_model.dart';
import 'package:status_app/services/user_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream, 
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('No user'));
          }
          return _UserInfo(user: snapshot.data!);
        }
      ),
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
          const SizedBox(height: 20),
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Name: ${user.name} ')),
          ListTile(title: Text('Age: ${user.age}')),
          const Text('Profession', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions.map((profession) => ListTile(
            title: Text(profession),
          )).toList(),
        ],
      )
    );
  }
}