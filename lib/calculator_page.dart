import 'package:flutter/material.dart';
import 'package:calculator/button.dart';

class CalculatorApp extends StatefulWidget{
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  CalculatorAppState createState () => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp>{

  late double firstNum;
  late double secondNum;
  late String operation;
  String result = "";
  String historyDisplay= "";
  String display= "";

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text("Flutter Calculator"),),
      ),
      body: Container(
        color: Colors.blueGrey[700],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                alignment: const Alignment(1.0, 2.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                    child: Text(historyDisplay, style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 173, 173, 173)),
                ),
              ),
            ),
            Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                    child: Text(display, style: const TextStyle(fontSize: 48, color: Colors.white),
                    maxLines: 2,
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(text: "AC", btnCallback: calculator),
                ButtonWidget(text: "C", btnCallback: calculator),
                ButtonWidget(text: "%", btnCallback: calculator),
                ButtonWidget(text: "/", btnCallback: calculator),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(text: "7", btnCallback: calculator),
                ButtonWidget(text: "8", btnCallback: calculator),
                ButtonWidget(text: "9", btnCallback: calculator),
                ButtonWidget(text: "X", btnCallback: calculator),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(text: "4", btnCallback: calculator),
                ButtonWidget(text: "5", btnCallback: calculator),
                ButtonWidget(text: "6", btnCallback: calculator),
                ButtonWidget(text: "-", btnCallback: calculator),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(text: "1", btnCallback: calculator),
                ButtonWidget(text: "2", btnCallback: calculator),
                ButtonWidget(text: "3", btnCallback: calculator),
                ButtonWidget(text: "+", btnCallback: calculator),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(text: "<", btnCallback: calculator),
                ButtonWidget(text: "0", btnCallback: calculator),
                ButtonWidget(text: "00", btnCallback: calculator),
                ButtonWidget(text: "=", btnCallback: calculator),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calculator (String btnValue){
    if (btnValue == "AC" || btnValue == "C"){
      historyDisplay = "";
      display = "";
      result = "";
    }else if(btnValue == "<"){
      result = display.substring(0, display.length - 1);
    }else if (btnValue == "+" || btnValue == "-" || btnValue == "X" || btnValue == "/" || btnValue == "%"){
      firstNum = double.parse(display);
      operation = btnValue;
      result = "";
    }else if (btnValue == "="){
      secondNum = double.parse(display);
      if (operation == "+"){
        result = (firstNum + secondNum).toString();
        historyDisplay = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "-"){
        result = (firstNum - secondNum).toString();
        historyDisplay = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "X"){
        result = (firstNum * secondNum).toString();
        historyDisplay = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "/"){
        result = (firstNum / secondNum).toString();
        historyDisplay = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "%"){
        late double porcentagem;
        porcentagem = secondNum/100;
        result = (firstNum * porcentagem).toString();
        historyDisplay = firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }else{
      result = display + btnValue;
    }
    setState(() {
      display = result;
    });
  }

}