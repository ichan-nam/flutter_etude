import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'First Flutter Etude',
            style: TextStyle(color: Colors.blue.shade900),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outlined,
                color: Colors.pink,
              ),
            )
          ],
          backgroundColor: Colors.blue.shade50,
        ),
        body: const Center(
          child: Text(
            '시작이 반이다.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
