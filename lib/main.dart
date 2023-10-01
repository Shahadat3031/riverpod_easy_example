import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/counter_provider.dart';
import 'package:riverpod_demo/screen/drop_down_example.dart';
import 'package:riverpod_demo/screen/edit_text_example.dart';
import 'package:riverpod_demo/screen/future_provider/our_future_provider.dart';
import 'package:riverpod_demo/screen/state_notifier_provider/our_state_notifier_provider.dart';
import 'package:riverpod_demo/screen/stream_provider/our_stream_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
   return HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Demo", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Consumer(
              builder: (context, ref, child){
                int counter = ref.watch(counterProvider);
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterScreen()),
              );
            }, child: Text("State Notifier Provider"))
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "Decrement",
                onPressed: (){
                  ref.read(counterProvider.notifier).decrement();
                },
                tooltip: 'Second Increment',
                child: Icon(Icons.exposure_minus_1),
              ),
              FloatingActionButton(
                heroTag: "Increment",
                onPressed: (){
                  ref.read(counterProvider.notifier).increment();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: "DropDown",
                onPressed: (){
                 // Goto to DropDownExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DropdownExample()),
                  );
                },
                tooltip: 'Dropdown',
                child: Icon(Icons.water_drop),
              ),FloatingActionButton(
                heroTag: "EditText",
                onPressed: (){
                 // Goto to DropDownExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditTextExample()),
                  );
                },
                tooltip: 'Dropdown',
                child: Icon(Icons.edit),
              ),
              FloatingActionButton(
                heroTag: "Weather",
                onPressed: (){
                 // Goto to DropDownExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherScreen()),
                  );
                },
                tooltip: 'Weather',
                child: Icon(Icons.ac_unit),
              ),
              FloatingActionButton(
                heroTag: "Numbers",
                onPressed: (){
                 // Goto to DropDownExample
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NumbersScreen()),
                  );
                },
                tooltip: 'Numbers',
                child: Icon(Icons.numbers),
              ),
            ],
          );
        },
      ),
    );
  }
}
