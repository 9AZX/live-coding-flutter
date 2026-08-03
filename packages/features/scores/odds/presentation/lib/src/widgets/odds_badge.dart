import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odds_domain/odds_domain.dart';
import 'package:odds_presentation/src/l10n/odds_strings.dart';
import 'package:odds_presentation/src/providers_di.br.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Badge « 1 N 2 » d'une rencontre. Rend une boîte vide quand le marché est fermé
/// ou que le match est terminé, pour ne pas décaler la rangée qui l'héberge.
class OddsBadge extends ConsumerWidget {
  final Match match;

  const OddsBadge({required this.match, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (match.isFinished) return const SizedBox.shrink();

    final odds = ref.watch(oddsForMatchProvider(match.id));

    if (odds == null) return const SizedBox.shrink();

    final favourite = ref.watch(favouriteOutcomeProvider)(odds);

    return Padding(
      padding: const EdgeInsets.only(top: TacticsSpacing.spacing200),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: TacticsSpacing.spacing100,
        children: [
          _Quote(label: OddsStrings.home, isFavourite: favourite == MatchOutcome.home, quote: odds.home),
          _Quote(label: OddsStrings.draw, isFavourite: favourite == MatchOutcome.draw, quote: odds.draw),
          _Quote(label: OddsStrings.away, isFavourite: favourite == MatchOutcome.away, quote: odds.away),
        ],
      ),
    );
  }
}

class _Quote extends ConsumerWidget {
  final bool isFavourite;
  final String label;
  final double quote;

  const _Quote({required this.isFavourite, required this.label, required this.quote});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(oddsThemeProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isFavourite ? theme.favouriteBackgroundColor : theme.backgroundColor,
        borderRadius: BorderRadius.circular(TacticsRadius.sm),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TacticsSpacing.spacing200, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: TacticsSpacing.spacing100,
          children: [
            Text(label, style: theme.labelTextStyle),
            Text(
              quote.toStringAsFixed(2),
              style: isFavourite ? theme.favouriteQuoteTextStyle : theme.quoteTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
