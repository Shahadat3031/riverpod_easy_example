import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/future_provider/dummy_weather_report.dart';

final weatherProvider = FutureProvider((ref) => fetchWeatherReport());
// final weatherProvider = FutureProvider.autoDispose((ref) => fetchWeatherReport());

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: ref.watch(weatherProvider).when(data: (data){
        return Center(
          child: Text(data),
        );
      }, error: (error, stackTrace){
        return Center(
          child: Text(error.toString()),
        );
      }, loading: (){
        return Center(child: CircularProgressIndicator());
      })
    );
  }
}
