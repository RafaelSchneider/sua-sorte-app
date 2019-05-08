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

  static List<int> _returnNumbersSorted(int quantityOfNumbers) {
    List<int> _megaList = new List();
    var rand = new Random();
    for (int numero = 1; numero <= quantityOfNumbers; numero++) {
      int number = rand.nextInt(60);
      if (number > 0)
        _megaList.add(number);
    }
    return _megaList;
  }

  Container _container(TextEditingController textEditing){
    return Container (
        height: 50,
        width: 200,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
        decoration: _myDecoration(),
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: TextField(
            style: TextStyle(
              fontSize: 17
            ),
            controller: textEditing,
            enabled: false,
        ),
    );
  }
  Container _containerWithText(String title){
    return Container(
      child: Text(title,
                  style: TextStyle(
                    fontSize: 20
                  )),

    );
  }
  BoxDecoration _myDecoration(){
    return BoxDecoration(
        color: Colors.lightBlue[100],
        border: Border.all()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _containerWithText("Mega Sena"),
            _container(_inputMegaSenaController),
            _containerWithText("Quina"),
            _container(_inputQuinaController),
            _containerWithText("Quadra"),
            _container(_inputQuadraController)
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
