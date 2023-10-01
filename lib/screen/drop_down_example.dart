import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownExample extends ConsumerWidget {
  DropdownExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center( child: Text("Hello World", style: TextStyle(fontSize: 30),),);
      // child: DropdownButton<String>(
      //   value: "One",
      //   onChanged: (String newValue) {},
      //   items: <String>['One', 'Two', 'Three', 'Four']
      //       .map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(value, style: TextStyle(fontSize: 30),),
      //     );
      //   }).toList(),
      // ),
  }
}
