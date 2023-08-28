import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: _UserInfo(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: const Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Name: '),
          ),
          ListTile(
            title: Text('Age: '),
          ),
          Text('Profession', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Profession: '),
          ),
          ListTile(
            title: Text('Experience: '),
          ),
          ListTile(
            title: Text('Company: '),
          ),
        ],
      )
    );
  }
}