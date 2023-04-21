import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // runApp() 실행 전 Engine 레이어 Platform Channels를 사용할 때 호출
  // 당장 위젯을 그리진 않고 binding만 함
  // runApp()은 첫 줄에서 WidgetsFlutterBinding.ensureInitialized() 호출
  WidgetsFlutterBinding.ensureInitialized();

  // Portrait 모드 고정
  // 얘가 Platform Channels를 사용하는 녀석
  // Platform Channels를 사용하는 메소드는 다 비동기
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
