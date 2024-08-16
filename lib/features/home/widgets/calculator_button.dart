import 'package:calculator/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isActionable;
  final bool isSubmitBtn;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActionable = false,
    this.isSubmitBtn = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSubmitBtn
            ? AppPallete.calculatorActionButtonColor
            : AppPallete.transparentColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: isActionable
              ? AppPallete.calculatorActionButtonColor
              : Colors.white,
        ),
      ),
    );
  }
}
