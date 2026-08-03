import 'package:favorites_domain/favorites_domain.dart';
import 'package:favorites_presentation/src/l10n/favorites_strings.dart';
import 'package:favorites_presentation/src/providers_di.br.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Écran Favoris : compose des widgets injectés (header, liste, état vide)
/// fournis par la feature Matchs. La liste se met à jour dès qu'on touche une
/// étoile dans Matchs ou En direct (état partagé via le domaine partagé).
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(favoritesThemeProvider.select((theme) => theme.backgroundColor));
    final favorites = ref.watch(favoriteMatchesProvider);

    return ColoredBox(
      color: backgroundColor,
      child: Column(
        children: [
          ref.watch(favoritesHeaderFactoryProvider).create(FavoritesStrings.headerTitle),
          Expanded(
            child: favorites.isEmpty
                ? ref.watch(favoritesEmptyStateFactoryProvider).create((
                    icon: Icons.star_rounded,
                    subtitle: FavoritesStrings.emptySubtitle,
                    title: FavoritesStrings.emptyTitle,
                  ))
                : ref.watch(favoritesListFactoryProvider).create(favorites),
          ),
        ],
      ),
    );
  }
}
