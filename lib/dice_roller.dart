import 'dart:math';
import 'package:flutter/material.dart';

const dices = [
  'assets/images/dice-1.png',
  'assets/images/dice-2.png',
  'assets/images/dice-3.png',
  'assets/images/dice-4.png',
  'assets/images/dice-5.png',
  'assets/images/dice-6.png',
];

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceImage = 'assets/images/dice-1.png';

  void rollDice() {
    var random = randomizer.nextInt(dices.length);
    setState(() {
      diceImage = dices[random];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(diceImage, width: 200),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              foregroundColor: Colors.indigo,
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text("Roll the dice"),
          ),
        ),
      ],
    );
  }
}
