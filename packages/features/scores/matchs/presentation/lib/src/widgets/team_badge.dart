import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';

/// Pastille ronde colorée avec le sigle de l'équipe.
class TeamBadge extends ConsumerWidget {
  final int colorValue;
  final String shortName;
  final double size;

  const TeamBadge({required this.colorValue, required this.shortName, this.size = 26, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = ref.watch(matchsThemeProvider.select((theme) => theme.rowTheme.teamBadgeTextStyle));

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Color(colorValue), shape: BoxShape.circle),
      child: Text(shortName, style: textStyle),
    );
  }
}
