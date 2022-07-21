import 'package:flutter/material.dart';
import 'user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Random User Profiles ')),
        ),
        body: UserProfileWidget(context),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
