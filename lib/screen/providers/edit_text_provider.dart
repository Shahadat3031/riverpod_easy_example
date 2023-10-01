
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editTextProvider = StateNotifierProvider.autoDispose<EditTextProvider, TextEditingController>((ref) {
  return EditTextProvider(TextEditingController());
});

class EditTextProvider extends StateNotifier<TextEditingController>{
  EditTextProvider(TextEditingController state) : super(state);
  void initializeController(){
    print("initialize controller");
    state = TextEditingController();
  }

  void setTextToController(String text){
    // initializeController();
    print("set text to controller");
    state.text = text;
  }

  void getTextFromController(){
    print("get text from controller");
    print(state.text);
  }

  clearTextFromController(){
    print("clear text from controller");
    state.clear();
  }

  //Notify id the provider is disposed or not
  @override
  void dispose() {
    print("dispose provider");
    super.dispose();
  }

  @override
  bool get mounted {
    print("mounted provider");
    return super.mounted;
  }


}