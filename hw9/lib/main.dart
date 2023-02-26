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
      title: 'Youtube Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YoutubeDemo(),
    );
  }
}

class YoutubeDemo extends StatefulWidget {
  const YoutubeDemo({super.key});

  @override
  State<YoutubeDemo> createState() => _YoutubeDemoState();
}

class _YoutubeDemoState extends State<YoutubeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text("Youtube Demo"),
      )),
    );
  }
}
