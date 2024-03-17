import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Timer _timer;
  String _currentTime = DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    // Создаем таймер, который будет вызывать функцию обновления каждую миллисекунду
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime = DateTime.now().toString();
      });
    });
  }

  @override
  void dispose() {
    // Останавливаем таймер при удалении виджета
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr, // Укажите нужное направление текста
        child: Text('Текущее время: ${_currentTime}')
    );
  }
}
