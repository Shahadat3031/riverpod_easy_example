import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeNotifierProvider = ChangeNotifierProvider<User>((ref) => User());

class User extends ChangeNotifier{
  String userName = 'Shahadat Hossain';

  void changeUserName(){
    // userName = "Name Changed";
    // notifyListeners();
    if(userName=="Shahadat Hossain"){
      userName = "Hossain Shahadat";
      notifyListeners();
    } else{
      userName = "Shahadat Hossain";
      notifyListeners();
    }
  }
}