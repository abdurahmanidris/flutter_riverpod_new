import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Theme',
      // theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
          titleTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
