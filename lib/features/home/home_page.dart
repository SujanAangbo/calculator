import 'package:calculator/core/theme/app_pallete.dart';
import 'package:calculator/features/home/provider/calculation_provider.dart';
import 'package:calculator/features/home/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculationProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (calculatorProvider.operand2.isNotEmpty)
                          Text(
                            "${calculatorProvider.operand2} ${calculatorProvider.operator != null ? calculatorProvider.getOperator() : ""} ",
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          calculatorProvider.operand1,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    )),
              ),
              if (calculatorProvider.error.isNotEmpty)
                Text(
                  calculatorProvider.error,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppPallete.errorColor,
                      ),
                ),
              const SizedBox(
                height: 10,
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 30,
                ),
                children: [
                  CalculatorButton(
                    text: "AC",
                    onPressed: () {
                      calculatorProvider.clearStack();
                    },
                    isActionable: true,
                  ),
                  CalculatorButton(
                    text: "x",
                    onPressed: () {
                      calculatorProvider.clearLast();
                    },
                    isActionable: true,
                  ),
                  CalculatorButton(
                    text: "%",
                    onPressed: () {
                      calculatorProvider.insertOperator("%");
                    },
                    isActionable: true,
                  ),
                  CalculatorButton(
                    text: "/",
                    onPressed: () {
                      calculatorProvider.insertOperator("/");
                    },
                    isActionable: true,
                  ),
                  CalculatorButton(
                    text: "7",
                    onPressed: () {
                      calculatorProvider.insertNumber("7");
                    },
                  ),
                  CalculatorButton(
                    text: "8",
                    onPressed: () {
                      calculatorProvider.insertNumber("8");
                    },
                  ),
                  CalculatorButton(
                    text: "9",
                    onPressed: () {
                      calculatorProvider.insertNumber("9");
                    },
                  ),
                  CalculatorButton(
                    text: "*",
                    onPressed: () {
                      calculatorProvider.insertOperator("*");
                    },
                    isActionable: true,
                  ),
                  CalculatorButton(
                    text: "4",
                    onPressed: () {
                      calculatorProvider.insertNumber("4");
                    },
                  ),
                  CalculatorButton(
                    text: "5",
                    onPressed: () {
                      calculatorProvider.insertNumber("5");
                    },
                  ),
                  CalculatorButton(
                    text: "6",
                    onPressed: () {
                      calculatorProvider.insertNumber("6");
                    },
                  ),
                  CalculatorButton(
                    text: "-",
                    onPressed: () {
                      calculatorProvider.insertOperator("-");
                    },
                    isActionable: true,
                  ),
                  CalculatorButton(
                    text: "1",
                    onPressed: () {
                      calculatorProvider.insertNumber("1");
                    },
                  ),
                  CalculatorButton(
                    text: "2",
                    onPressed: () {
                      calculatorProvider.insertNumber("2");
                    },
                  ),
                  CalculatorButton(
                    text: "3",
                    onPressed: () {
                      calculatorProvider.insertNumber("3");
                    },
                  ),
                  CalculatorButton(
                    text: "+",
                    onPressed: () {
                      calculatorProvider.insertOperator("+");
                    },
                    isActionable: true,
                  ),
                  const SizedBox(),
                  CalculatorButton(
                    text: "0",
                    onPressed: () {
                      calculatorProvider.insertNumber("0");
                    },
                  ),
                  CalculatorButton(
                    text: ".",
                    onPressed: () {
                      calculatorProvider.insertNumber(".");
                    },
                  ),
                  CalculatorButton(
                    text: "=",
                    onPressed: () {
                      calculatorProvider.calculate();
                    },
                    isSubmitBtn: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
