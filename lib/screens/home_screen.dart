import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가상인맥'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'meeting',
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
