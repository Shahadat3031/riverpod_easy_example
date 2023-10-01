import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamNumberProvider = StreamProvider.autoDispose<int>((ref) =>
    fetchNumbers()
);

Stream<int> fetchNumbers(){
  return Stream<int>.periodic(
    Duration(seconds: 2),
    (num) => num,
  ).take(100);
}