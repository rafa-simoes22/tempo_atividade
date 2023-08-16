import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white;
  String _message = '';
  int _secondsElapsed = 0;
  Duration _interval = Duration(seconds: 1);

  void _startTimer() {
    Future.delayed(_interval, () {
      setState(() {
        _secondsElapsed++;
        if (_secondsElapsed == 20) {
          _backgroundColor = Colors.yellow;
        } else if (_secondsElapsed == 40) {
          _backgroundColor = Colors.orange;
        } else if (_secondsElapsed == 60) {
          _backgroundColor = Colors.red;
          _message = 'Cada minuto dedicado ao aprendizado e crescimento pessoal é um passo na direção dos seus sonhos. Então, que tal aproveitar cada momento para construir um futuro incrível?';
        } else if (_secondsElapsed == 75) {
          _exitApp();
          return;
        }
      });
      _startTimer(); // Reiniciar o timer
    });
  }

  Future<void> _exitApp() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Encerrando Aplicativo'),
          content: Text('O aplicativo será encerrado em breve.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Fechar o aplicativo
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Text(
          _message,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
