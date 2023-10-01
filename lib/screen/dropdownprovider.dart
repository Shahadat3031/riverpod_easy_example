import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider =
ChangeNotifierProvider<PostProvider>((ref) => PostProvider());

class PostProvider extends ChangeNotifier {
  String _postCategory;

  String get postCategory => _postCategory;

  categoryOnChanged(String value) {
    if (value.isEmpty) {
      return _postCategory;
    }
    _postCategory = value;
    print(_postCategory);
    return notifyListeners();
  }
}