import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/l10n/matchs_strings.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:tactics_components/tactics_components.dart';

/// Bandeau rouge commun aux écrans : titre deux tons, avec un `bottom`
/// optionnel (onglets de jour pour l'écran Matchs).
class ScoresHeader extends ConsumerWidget {
  final String title;
  final Widget? bottom;

  const ScoresHeader({required this.title, this.bottom, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchsThemeProvider.select((theme) => theme.headerTheme));

    return ColoredBox(
      color: theme.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            TacticsSpacing.spacing400,
            6,
            TacticsSpacing.spacing400,
            14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 34,
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(title, style: theme.titleTextStyle),
                    const SizedBox(width: TacticsSpacing.spacing200),
                    Text(MatchsStrings.headerSubtitle, style: theme.subtitleTextStyle),
                  ],
                ),
              ),
              if (bottom case final bottom?) ...[const SizedBox(height: 14), bottom],
            ],
          ),
        ),
      ),
    );
  }
}
