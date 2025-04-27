import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sthedule/models/quick_entry.dart';
import 'package:sthedule/pages/loginpage.dart';
import 'package:sthedule/provider/colorprovider.dart';
import 'package:sthedule/provider/quick_entry_provider.dart';
import 'package:sthedule/provider/workentry_provider.dart';

List<QuickEntry> favoriteEntries = [ QuickEntry('Tauko', 'Lounas', '', Icons.no_meals), QuickEntry('Kotikatu', 'Putkityöt', 'IV-putken veto', Icons.handyman),];

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()), // Initialize your provider here
        ChangeNotifierProvider(create: (context) => WorkEntryProvider()),
        ChangeNotifierProvider(create: (context) => QuickEntryProvider()),
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
      home: LoginPage(),
    );
  }
}

