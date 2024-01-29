import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterDemo extends StateNotifier<int> {
  //initializing the state with initial value as 0
  CounterDemo() : super(0);

  void increament() {
    state++;
  }
}
