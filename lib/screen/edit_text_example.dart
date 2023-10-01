import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/providers/edit_text_provider.dart';

class EditTextExample extends ConsumerWidget {
  const EditTextExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editTextProviderObj = ref.watch(editTextProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("EditText Example", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Title" ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF172B4D),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              enabled: true,
              controller: editTextProviderObj,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                const EdgeInsets.only(top: 13, bottom: 15, left: 24),
                filled: true,
                fillColor: Colors.blueAccent.withOpacity(0.1),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: "Enter title",
                isDense: false,
              ),
            ),
            ElevatedButton(onPressed: (){
              ref.read(editTextProvider.notifier).initializeController();
            }, child: Text("Initialize Controller")),
            ElevatedButton(onPressed: (){
              ref.read(editTextProvider.notifier).setTextToController("Hello World");
            }, child: Text("Set Text to Controller")),
            ElevatedButton(onPressed: (){
              ref.read(editTextProvider.notifier).getTextFromController();
            }, child: Text("Get Text to Controller")),
            ElevatedButton(onPressed: (){
              ref.read(editTextProvider.notifier).clearTextFromController();
            }, child: Text("Clear Text from Controller")),
          ],
        ),
      ),
    );
  }
}
