import 'package:favorites_domain/favorites_domain.dart';
import 'package:favorites_presentation/src/providers_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Onglet Favoris : compose des widgets injectés (header, liste, état vide)
/// fournis par la feature Matchs. La liste se met à jour dès qu'on touche une
/// étoile dans Matchs ou En direct (état partagé via le common domain).
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteMatchesProvider);

    return Column(
      children: [
        ref.watch(favoritesHeaderFactoryProvider).create('Favoris'),
        Expanded(
          child: favorites.isEmpty
              ? ref.watch(favoritesEmptyStateFactoryProvider).create((
                  icon: Icons.star_rounded,
                  title: 'Aucun favori',
                  subtitle: "Touchez l'étoile sur un match pour le retrouver ici.",
                ))
              : ref.watch(favoritesListFactoryProvider).create(favorites),
        ),
      ],
    );
  }
}
