import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Address Form',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text("Address Form"),
            ),
          ),
          body: const MyCustomForm(),
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
  final emailController = TextEditingController();
  final zipCodeController = TextEditingController();
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String _dis = "";
  String _tam = "";

  List<dynamic> _data = [];
  List<String> _lists = [];

  List<String> convertToStringList(List<dynamic> list) {
    return list.map((e) => e.toString()).toList();
  }

  void _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/tambon_chiangmai.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      listData.removeAt(0);
      _data = listData;
    });
    List<dynamic> list1 = _data.expand((elem) => [elem[1]]).toList();
    list1 = Set.from(list1).toList();

    _lists = convertToStringList(list1);
  }

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            decoration:
                const InputDecoration(labelText: "Enter Email Address."),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please write your Email.";
              } else if (!regex.hasMatch(value)) {
                return "Invalid Email Format.";
              } else {
                return null;
              }
            },
            controller: emailController,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Zip Code."),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please write your Zip Code";
              } else if (value[0] == "0" ||
                  value.length > 5 ||
                  value.length < 5) {
                return "Invalid Zip Code Format";
              } else {
                return null;
              }
            },
            controller: zipCodeController,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Provice : Chiang Mai",
                style: TextStyle(fontSize: 25)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("District", style: TextStyle(fontSize: 25)),
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              } else {
                return _lists.where((String dis) {
                  return dis[0]
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }
            },
            onSelected: (String selection) {
              _dis = selection;
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Tambon", style: TextStyle(fontSize: 25)),
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              } else {
                List<String> test = [];
                for (int i = 0; i < _data.length; i++) {
                  if (_data[i][1] == _dis) {
                    test.add(_data[i][0]);
                  }
                }
                return test.where((String tam) {
                  return tam
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }
            },
            onSelected: (String selection) {
              _tam = selection;
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Processing Data")));
                }
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
