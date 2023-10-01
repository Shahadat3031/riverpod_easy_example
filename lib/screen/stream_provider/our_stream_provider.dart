import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/stream_provider/fetch_numbers.dart';
class NumbersScreen extends ConsumerWidget {
  const NumbersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(streamNumberProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: Center(
        child: asyncValue.when(data: (data){
          return Center(
            child: Text(data.toString()),
          );
        }, error: (error, stackTres){
          return Center(
            child: Text(error.toString()),
          );
        }, loading: (){
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
