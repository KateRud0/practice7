import 'package:flutter/material.dart';

// Эмуляция запроса к внешнему API
Future<String> fetchFromExternalAPI() {
  return Future.delayed(Duration(seconds: 2), () {
    return 'Данные из внешнего API';
  });
}

// Эмуляция сохранения данных в базу данных
Future<void> saveToDatabase(String data) async {
  await Future.delayed(Duration(seconds: 1));
  print('Данные сохранены в базе данных: $data');
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Асинхронное приложение',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _statusMessage = 'Нажмите на кнопку, чтобы начать';

  void _startAsyncProcess() async {
    setState(() {
      _statusMessage = 'Запрос данных из внешнего API...';
    });

    String externalData = await fetchFromExternalAPI();

    setState(() {
      _statusMessage = 'Получены данные из внешнего API: $externalData';
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _statusMessage = 'Сохранение данных в базе данных...';
    });

    await saveToDatabase(externalData);

    setState(() {
      _statusMessage = 'Данные сохранены в базе данных';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Асинхронное приложение'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Статус:',
            ),
            SizedBox(height: 10),
            Text(
              _statusMessage,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startAsyncProcess,
              child: Text('Начать асинхронный процесс'),
            ),
          ],
        ),
      ),
    );
  }
}
