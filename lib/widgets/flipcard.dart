import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class ChemCard extends StatelessWidget {
  final String ion;
  final String text;

  ChemCard({this.ion, this.text});
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: true,
      speed: 1000,
      onFlipDone: (isFront) => FlipCardController().toggleCard(),
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        decoration: BoxDecoration(
          color: Color(0x9EAB55FF),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Math.tex(
            ion,
            textStyle: TextStyle(
              color: Colors.white,
            ),
            textScaleFactor: 3,
          ),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          color: Color(0x9EAB55FF),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Math.tex(
            text,
            textStyle: TextStyle(
              color: Colors.white,
            ),
            textScaleFactor: 3,
          ),
        ),
      ),
    );
  }
}
