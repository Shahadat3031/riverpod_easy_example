import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/change_notifier_provider/user.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: Consumer(
          builder: (context, ref, child){
            var name = ref.watch(changeNotifierProvider);
            return Center(child: Text(name.userName));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(changeNotifierProvider.notifier).changeUserName();
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
