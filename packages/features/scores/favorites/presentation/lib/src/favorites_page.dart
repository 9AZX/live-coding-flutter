import 'package:favorites_domain/favorites_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Onglet Favoris : liste les matchs suivis (étoile). La liste se met à jour
/// dès qu'on touche une étoile dans Matchs ou En direct (état partagé).
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.scoresTheme;
    final favorites = ref.watch(favoriteMatchesProvider);

    return Column(
      children: [
        const ScoresHeader(title: 'Favoris'),
        Expanded(
          child: favorites.isEmpty
              ? const EmptyState(
                  icon: Icons.star_rounded,
                  title: 'Aucun favori',
                  subtitle: "Touchez l'étoile sur un match pour le retrouver ici.",
                )
              : ListView(
                  padding: const EdgeInsets.only(top: 18, bottom: 18),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 9),
                      child: Text(
                        'Mes matchs',
                        style: TextStyle(
                          fontFamily: theme.palette.fontBrand,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: theme.palette.night,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: theme.palette.white,
                        borderRadius: BorderRadius.circular(theme.palette.rXl),
                        boxShadow: theme.palette.shadowCard,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          for (var i = 0; i < favorites.length; i++)
                            MatchRow(match: favorites[i], showDivider: i != favorites.length - 1),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
