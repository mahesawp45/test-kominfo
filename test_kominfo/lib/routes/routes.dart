import 'package:flutter/material.dart';
import 'package:test_kominfo/pages/detail_pengaduan.dart';
import 'package:test_kominfo/pages/form_pengaduan_page.dart';
import 'package:test_kominfo/pages/home_page.dart';
import 'package:test_kominfo/pages/register_page.dart';

abstract class Routes {
  static const String home = "/";
  static const String form_pengaduan = "/form-pengaduan";
  static const String detail_pengaduan = "/detail-pengaduan";
  static const String register = "/register";
}

abstract class AppRouter {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routes.form_pengaduan:
        return MaterialPageRoute(
          builder: (context) => const FormPengaduanPage(),
        );
      case Routes.detail_pengaduan:
        return MaterialPageRoute(
          builder: (context) => const DetailPengaduanPage(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: SizedBox(),
          ),
        );
    }
  }
}
