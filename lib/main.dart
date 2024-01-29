import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>(((ref) {
  return Stream.periodic(
      const Duration(seconds: 2), ((computationCount) => computationCount));
}));

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
          titleTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider"),
      ),
      body: streamData.when(
          data: ((data) => Center(
                child: Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              )),
          error: ((error, StackTrace) => Text(error.toString())),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
