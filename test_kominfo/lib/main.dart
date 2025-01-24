import 'package:flutter/material.dart';
import 'package:test_kominfo/pages/home_page.dart';
import 'package:test_kominfo/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Kominfo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: AppRouter.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
