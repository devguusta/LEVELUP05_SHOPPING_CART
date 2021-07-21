import 'package:flutter/material.dart';

import 'src/pages/checkout_page.dart';
import 'src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/checkout': (BuildContext context) => Checkout()
      }
    );
  }
}