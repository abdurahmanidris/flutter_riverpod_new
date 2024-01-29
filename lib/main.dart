import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/api_service.dart';

import 'user_model.dart';

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});

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
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Data"),
        ),
        body: userData.when(
            data: (data) {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                        "${data[index].firstname} ${data[index].lastname}"),
                    subtitle: Text(data[index].email),
                    leading:
                        CircleAvatar(child: Image.network(data[index].avatar)),
                  );
                }),
                itemCount: data.length,
              );
            },
            error: ((error, stackTrace) => Text(error.toString())),
            loading: (() {
              return const Center(
                child: CircularProgressIndicator(),
              );
            })));
  }
}
