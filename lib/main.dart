import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorte Sua App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Sorte Sua App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _inputMegaSenaController = new TextEditingController();
  TextEditingController _inputQuinaController = new TextEditingController();
  TextEditingController _inputQuadraController = new TextEditingController();

  void _sortedNumbers() {
    setState(() {
      _inputMegaSenaController.text = _returnNumbersSorted(6).toString();
      _inputQuinaController.text = _returnNumbersSorted(5).toString();
      _inputQuadraController.text = _returnNumbersSorted(4).toString();
    });
  }

  List<int> _returnNumbersSorted(int quantityOfNumbers) {
    List<int> _megaList = new List();
    var rand = new Random();
    for (int numero = 1; numero <= quantityOfNumbers; numero++) {
      int number = rand.nextInt(60);
      if (number > 0)
        _megaList.add(number);
    }
    return _megaList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputMegaSenaController,
              enabled: false,
            ),TextField(
              controller: _inputQuinaController,
              enabled: false,
            ),TextField(
              controller: _inputQuadraController,
              enabled: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sortedNumbers,
        tooltip: 'Increment',
        child: Icon(Icons.adb),
      ),
    );
  }
}
