import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isolates_demo/controller/calculator.dart';
import 'package:flutter_isolates_demo/screens/second_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final calculator = Calculator();


  @override
  Widget build(BuildContext context) {
    // calculator.addWithoutIsolage();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SecondScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.login),
          ),
          IconButton(
            onPressed: calculator.downloadVideoWithIsolate,
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Center(
        child: Image.asset("assets/ball.gif"),
      ),
    );
  }
}
