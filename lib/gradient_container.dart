import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';

const beginAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.colors = const [Colors.indigo, Colors.blue],
  });
  const GradientContainer.blue({super.key})
    : colors = const [Colors.indigo, Colors.blue];
  const GradientContainer.orange({super.key})
    : colors = const [Colors.orange, Colors.yellow];
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
