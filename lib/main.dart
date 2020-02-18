import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  Widget builtButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24),
        child: Text(buttonText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        onPressed: () => buttonPressed(buttonText),
        color: Colors.blueGrey,
        textColor: Colors.black,
      ),
    );
  }

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = "0";
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already having a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator in Flutter'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.centerRight,
            child: Text(
              output,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: <Widget>[
              Row(children: <Widget>[
                builtButton("7"),
                builtButton("8"),
                builtButton("9"),
                builtButton("/"),
              ]),
              Row(children: <Widget>[
                builtButton("4"),
                builtButton("5"),
                builtButton("6"),
                builtButton("*"),
              ]),
              Row(children: <Widget>[
                builtButton("1"),
                builtButton("2"),
                builtButton("3"),
                builtButton("-"),
              ]),
              Row(children: <Widget>[
                builtButton("."),
                builtButton("0"),
                builtButton("00"),
                builtButton("+"),
              ]),
              Row(children: <Widget>[
                builtButton("CLEAR"),
                builtButton("="),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
