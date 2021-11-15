import 'package:botes_app/pages/detail_page.dart';
import 'package:flutter/material.dart';

//!ROUTES
import 'package:botes_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botes App',
      initialRoute: 'home',
      routes: {
        'home': (_)=> HomePage(),
        'detail': (_)=> DetailPage(),
      },
    );
  }
}