import 'package:flutter/material.dart';

/// Pastille ronde colorée avec le sigle de l'équipe.
class TeamBadge extends StatelessWidget {
  const TeamBadge({
    required this.shortName,
    required this.colorValue,
    this.size = 26,
    this.fontSize = 10,
    super.key,
  });

  final String shortName;
  final int colorValue;
  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Color(colorValue), shape: BoxShape.circle),
    child: Text(
      shortName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
        letterSpacing: -0.3,
      ),
    ),
  );
}
