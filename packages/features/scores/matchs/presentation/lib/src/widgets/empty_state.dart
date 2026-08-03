import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';

/// État vide centré : icône estompée + titre + sous-titre.
class EmptyState extends ConsumerWidget {
  final IconData icon;
  final String subtitle;
  final String title;

  const EmptyState({required this.icon, required this.subtitle, required this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchsThemeProvider.select((theme) => theme.emptyStateTheme));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 44, color: theme.iconColor),
            const SizedBox(height: 14),
            Text(title, textAlign: TextAlign.center, style: theme.titleTextStyle),
            const SizedBox(height: 6),
            Text(subtitle, textAlign: TextAlign.center, style: theme.subtitleTextStyle),
          ],
        ),
      ),
    );
  }
}
