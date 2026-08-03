import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/l10n/matchs_strings.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:matchs_presentation/src/widgets/match_card.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Liste des matchs favoris (section « Mes matchs » + carte de rangées).
/// Partagée avec la feature Favoris via une `WidgetFactory`.
class FavoritesList extends ConsumerWidget {
  final List<Match> matches;

  const FavoritesList({required this.matches, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = ref.watch(matchsThemeProvider.select((theme) => theme.sectionTitleTextStyle));

    return ListView(
      padding: const EdgeInsets.only(top: 18, bottom: 18),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(TacticsSpacing.spacing400, 0, TacticsSpacing.spacing400, 9),
          child: Text(MatchsStrings.favoritesSectionTitle, style: textStyle),
        ),
        MatchCard(matches: matches),
      ],
    );
  }
}
