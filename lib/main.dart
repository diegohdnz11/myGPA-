import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home.dart';
import 'package:go_router/go_router.dart';
import 'package:classic_gpa/config/routes/routes.dart';

void main() {
  runApp(const MyGpa());
}

class MyGpa extends StatelessWidget {
  const MyGpa({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRoute().router;
    return MaterialApp.router(
      title: 'My GPA',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
