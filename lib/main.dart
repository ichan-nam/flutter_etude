import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_etude/providers/favorites_provider.dart';
import 'package:flutter_etude/screens/home_screen.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:provider/provider.dart';

void main() async {
  // 안드로이드에서 HTTPS 통신 시 CERTIFICATE_VERIFY_FAILED 에러를 피하기 위한 코드
  // 배포할 때는 정상적인 인증서를 등록해야 함
  HttpOverrides.global = MyHttpOverrides();

  // runApp() 실행 전 Engine 레이어 Platform Channels를 사용할 때 호출
  // 당장 위젯을 그리진 않고 binding만 함
  // runApp()은 첫 줄에서 WidgetsFlutterBinding.ensureInitialized() 호출
  WidgetsFlutterBinding.ensureInitialized();

  // Portrait 모드 고정
  // 얘가 Platform Channels를 사용하는 녀석
  // Platform Channels를 사용하는 메소드는 다 비동기
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FavoritesProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        primaryColor: CustomColors.customPink3,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.customWhite,
          foregroundColor: CustomColors.customPink3,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: CustomColors.customWhite,
          selectedItemColor: CustomColors.customPink3,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: CustomColors.customWhite),
      ),
    );
  }
}

// 안드로이드에서 HTTPS 통신 시 CERTIFICATE_VERIFY_FAILED 에러를 피하기 위한 코드
// 배포할 때는 정상적인 인증서를 등록해야 함
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
