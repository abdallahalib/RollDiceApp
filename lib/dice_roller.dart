import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class _DiceRollerState extends State<DiceRoller>
    with SingleTickerProviderStateMixin {
  var diceImage = 'assets/images/dice-1.png';
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void rollDice() {
    HapticFeedback.mediumImpact();
    var random = randomizer.nextInt(dices.length);
    setState(() {
      diceImage = dices[random];
    });
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
          turns: animation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Image.asset(diceImage, width: 200, height: 200),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: TextButton.icon(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              foregroundColor: Colors.indigo,
              textStyle: const TextStyle(fontSize: 18),
            ),
            label: const Text("Roll the dice"),
            icon: const Icon(Icons.casino),
          ),
        ),
      ],
    );
  }
}
