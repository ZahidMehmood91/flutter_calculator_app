import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var input = "";
  var num = "";

  Widget btn(num) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, textStyle: TextStyle(fontSize: 40)),
        onPressed: () {
          setState(() {
            input = input + num;
          });
        },
        child: Text(num));
  }

  clearScreen() {
    setState(() {
      input = "";
    });
  }

  evaluateResult() {
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      input = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.blue[100], width: 15),
                right: BorderSide(color: Colors.blue[100], width: 15),
                top: BorderSide(color: Colors.blue[500], width: 10),
                bottom: BorderSide(color: Colors.blue[500], width: 10),
              ),
            ),
            child: Center(
                child: Text(
              input,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
              children: [
                Container(
                  color: Colors.blue,
                  child: btn("1"),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("2"),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("3"),
                ),
                Container(
                  color: Colors.green,
                  child: btn(" + "),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("4"),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("5"),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("6"),
                ),
                Container(
                  color: Colors.green,
                  child: btn(" - "),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("7"),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("8"),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("9"),
                ),
                Container(
                  color: Colors.green,
                  child: btn(" * "),
                ),
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: TextStyle(fontSize: 40)),
                      onPressed: clearScreen,
                      child: Text("C")),
                ),
                Container(
                  color: Colors.blue,
                  child: btn("0"),
                ),
                Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            textStyle: TextStyle(fontSize: 40)),
                        onPressed: evaluateResult,
                        child: Text(" = "))),
                Container(
                  color: Colors.green,
                  child: btn(" / "),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
