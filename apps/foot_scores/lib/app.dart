import 'package:composition_root/composition_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/matchs_presentation.dart';

/// Racine de l'app : attache le `ScoresTheme` (auto-fourni par la feature
/// Matchs) à `ThemeData` et affiche le shell à onglets.
class FootScoresApp extends ConsumerWidget {
  const FootScoresApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresTheme = ref.watch(scoresThemeProvider);

    return MaterialApp(
      title: 'Foot Scores',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: scoresTheme.palette.bgPage,
        fontFamily: scoresTheme.palette.fontBrand,
        extensions: [scoresTheme],
      ),
      home: const ScoresShell(),
    );
  }
}
