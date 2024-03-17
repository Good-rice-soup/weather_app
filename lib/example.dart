import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  late Timer _timer;
  int _time = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      int i = DateTime.now().second;
      setState(() {
        _time = i%2;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        colorScheme: () {switch (_time) {
          case 0:
            return ColorScheme.fromSeed(seedColor: Colors.amberAccent);

          default:
            return ColorScheme.fromSeed(seedColor: Colors.cyan);
        }}(),
        scaffoldBackgroundColor: () {switch (_time) {
          case 0:
            return Colors.cyan;

          default:
            return Colors.amberAccent[700];
        }}(),
        useMaterial3: true,
      ),
      home: HomePage(onTap: onTap,),
    );
  }

  void onTap() {
    setState(() {
      _time = (_time > 0) ? 0 : 1;
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: widget.onTap,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 20.0,
              height: 100.0,
            ),
            FloatingActionButton(
              onPressed: widget.onTap,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            Text('${DateTime.now().second}.${DateTime.now().millisecond}')
          ],
        ),),
    );
  }
}