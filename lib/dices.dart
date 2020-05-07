import 'package:flutter/material.dart';

class Dices extends StatelessWidget {
  final int leftDiceNumber;
  final int rightDiceNumber;

  Dices(this.leftDiceNumber, this.rightDiceNumber);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'images/dice$leftDiceNumber.png',
            width: 100.0,
            height: 200.0,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'images/dice$rightDiceNumber.png',
            width: 100.0,
            height: 200.0,
          ),
        ),
      ],
    );
  }
}
