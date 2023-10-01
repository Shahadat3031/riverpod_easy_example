import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/state_notifier_provider/change_notifier.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("State Notifier Provider"),
      ),
      body: Center(child: Text(count.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
