import 'package:flutter/material.dart';
import 'package:markitup/pages/tasklistpage.dart';
import 'package:markitup/provider/colorprovider.dart';
import 'package:markitup/provider/taskprovider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()), // Initialize your provider here
        ChangeNotifierProvider(create: (context) => Taskprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasklistPage(),
    );
  }
}

