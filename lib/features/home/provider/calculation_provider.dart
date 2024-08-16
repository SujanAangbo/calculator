import 'package:calculator/features/home/operands.dart';
import 'package:flutter/cupertino.dart';

class CalculationProvider with ChangeNotifier {
  String operand2 = "";
  List<String> stack = [];
  String operand1 = "";
  Operator? operator;
  String error = "";

  void insertNumber(String number) {
    error = "";
    stack.add(number);
    getLetters();
  }

  String getOperator() {
    switch (operator) {
      case Operator.add:
        return "+";
      case Operator.sub:
        return "-";
      case Operator.mul:
        return "*";
      case Operator.div:
        return "/";
      case Operator.mod:
        return "%";
      default:
        return "";
    }
  }

  void insertOperator(String operator) {

    if(operand1.isEmpty && operand2.isEmpty) {
      error = "Insert number before operator";
      notifyListeners();
      return;
    }

    if(operand1.isEmpty) {
      error = "Insert number after operator";
      notifyListeners();
      return;
    }

    error = "";

    switch (operator) {
      case "+":
        this.operator = Operator.add;
      case "-":
        this.operator = Operator.sub;
      case "*":
        this.operator = Operator.mul;
      case "/":
        this.operator = Operator.div;
      case "%":
        this.operator = Operator.mod;
    }
    operand2 = operand1;
    stack = [];
    operand1 = "";
    notifyListeners();
  }

  void calculate() {
    if (operand1.isEmpty) {
      error = "No number";
      return;
    } else if (operator != null && operand1.isEmpty) {
      error = "Insert number after operator";
      return;
    } else if (operator == null) {
      return;
    }

    error = "";

    double? second = double.tryParse(operand1);
    double? first = double.tryParse(operand2);

    if (first == null || second == null) {
      // clearing data
      stack = [];
      operand1 = "";
      operator = null;
      operand2 = "";
      getLetters();
      return;
    }

    double res;

    switch (operator) {
      case Operator.add:
        res = first + second;
      case Operator.sub:
        res = first - second;
      case Operator.mul:
        res = first * second;
      case Operator.div:
        res = first / second;
      case Operator.mod:
        res = first % second;
      default:
        res = 0.0;
    }

    // format the result properly
    String formattedRes;

    if((res - res.toInt()) == 0)  {
      formattedRes = res.toInt().toString();
    } else {
      String str = res.toString();
      int index = str.indexOf(".");

      formattedRes = str.substring(0, str.length - index - 1 > 10 ? index + 11 : str.length);
    }


    // clearing data
    stack = [];
    stack.add(formattedRes);
    operator = null;
    operand2 = "";
    getLetters();

  }

  void clearLast() {
    stack.removeLast();
    getLetters();
  }

  void clearStack() {
    error = "";
    operand1 = "";
    operand2 = "";
    operator = null;
    stack = [];
    getLetters();
  }

  void getLetters() {
    operand1 = "";
    for (int i = 0; i < stack.length; i++) {
      operand1 += stack[i];
    }
    notifyListeners();
  }
}
