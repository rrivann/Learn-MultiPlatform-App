import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final Function() onTap;
  IconData? icon;

  CalculatorButton({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  CalculatorButton.icon({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: foregroundColor),
                )
              : Icon(
                  icon,
                  color: foregroundColor,
                ),
        ),
      ),
    );
  }
}
