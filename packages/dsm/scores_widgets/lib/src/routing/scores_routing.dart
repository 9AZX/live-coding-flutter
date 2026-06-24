import 'package:flutter/widgets.dart';

/// Port de navigation partagé : une ligne de match émet l'intention d'ouvrir un
/// détail ; la composition (`scores_router`) la traduit en navigation concrète.
abstract interface class ScoresRouting {
  void onMatchSelected(BuildContext context, String matchId);
}
