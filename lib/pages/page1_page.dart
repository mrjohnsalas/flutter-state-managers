import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_app/controllers/user_controller.dart';
import 'package:status_app/models/user_model.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    
    final userController = Get.put(UserController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              userController.clearUser();
            },
          )
        ],
      ),
      body: Obx(() => userController.userExist.value 
        ? _UserInfo(user: userController.user.value)
        : const Center(child: Text('User does not exist'))
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        //onPressed: () => Navigator.pushNamed(context, 'page2'),
        onPressed: () => Get.toNamed('page2'),
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
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Age: ${user.age}'),
          ),
          const Text('Profession', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions!.map((profession) => ListTile(
            title: Text(profession),
          )).toList(),
        ],
      )
    );
  }
}