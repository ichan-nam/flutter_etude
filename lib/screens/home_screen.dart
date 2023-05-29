import 'package:flutter/material.dart';
import 'package:flutter_etude/screens/favorites_screen.dart';
import 'package:flutter_etude/screens/meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final _widgetOptions = <Widget>[
    FavoritesScreen(),
    MeetingScreen(),
  ];

  late final _actionsOptions = <Widget>[
    Container(),
    IconButton(
      onPressed: _onRefreshTapped,
      icon: const Icon(Icons.refresh),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onRefreshTapped() {
    setState(() {
      // 직접적으로 수정해줘야 rerendering
      _widgetOptions[1] = MeetingScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가상인맥'),
        actions: [_actionsOptions[_selectedIndex]],
      ),
      body: _widgetOptions[_selectedIndex],
      // BottomNavigationBar
      // https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
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
