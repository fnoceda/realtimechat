import 'package:flutter/material.dart';
import 'package:realtimechat/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat APP',
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}
