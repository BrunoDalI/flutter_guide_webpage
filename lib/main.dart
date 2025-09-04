import 'package:flutter/material.dart';
import 'features/login/presentation/pages/home_page.dart';
import 'features/login/presentation/pages/bloc_page.dart';
import 'features/login/presentation/pages/riverpod_page.dart';
import 'features/login/presentation/pages/solid_principles_page.dart';
import 'features/login/presentation/pages/clean_architecture_page.dart';
import 'features/login/presentation/pages/best_practices_page.dart';
import 'features/login/presentation/pages/resources_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFF6F7FB),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo.shade900),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            elevation: 2,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          elevation: 2,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/solid': (context) => SolidPrinciplesPage(),
        '/clean': (context) => CleanArchitecturePage(),
        '/bloc': (context) => BlocPage(),
        '/riverpod': (context) => RiverpodPage(),
        '/best': (context) => BestPracticesPage(),
        '/resources': (context) => ResourcesPage(),
      },
    );
    
  }
}
