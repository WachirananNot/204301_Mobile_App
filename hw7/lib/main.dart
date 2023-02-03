import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final fruits = ["Apple", "Banana", "Orange", "Grape"];
  String _fruit = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              } else {
                return null;
              }
            },
            controller: nameController,
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              } else {
                return fruits.where((String fruit) {
                  return fruit
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }
            },
            onSelected: (String selection) {
              _fruit = selection;
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Processing...${nameController.text} , $_fruit")));
                }
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
