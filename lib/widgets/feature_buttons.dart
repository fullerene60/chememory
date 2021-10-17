import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeatureButton extends StatelessWidget {
  final String text;
  final Function whatIDo;
  final IconData icon;

  const FeatureButton({Key key, this.text, this.whatIDo, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FaIcon(icon),
          onPressed: whatIDo,
        ),
        Text(text)
      ],
    );
  }
}
