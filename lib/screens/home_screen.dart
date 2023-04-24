import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const _widgetOptions = <Widget>[
    Text('LIST'),
    Text('MEETING'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가상인맥'),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
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
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
