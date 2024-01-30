import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_page.g.dart';

// final nameProvider = Provider<String>((ref) => 'Abdurahman Idris');

//this makes the provider autodisposable
// @riverpod

//this removes the autodisposable : @Riverpod(keepAlive: true); by default KeepAlive is false
@Riverpod(keepAlive: true)
String name(NameRef ref) {
  return "Abdurahman XXX";
}

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Generator'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
