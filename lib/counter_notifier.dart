import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increament() {
    state++;
  }

  void decreament() {
    state--;
  }
}

//expose the CounterNotifier with this NotifierProvider
final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() {
  return CounterNotifier();
});

class NameNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void studentName() {
    state = "Abdurahman Idris";
  }

  void companyName() {
    state = "Commercial Bank of Ethiopia";
  }
}

final nameNotifierProvider = NotifierProvider<NameNotifier, String>(() {
  return NameNotifier();
});
