import 'package:flutter/material.dart';
import 'package:uni_flutter_sql/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Login Example',
      home: LoginScreen(),
    );
  }
}
