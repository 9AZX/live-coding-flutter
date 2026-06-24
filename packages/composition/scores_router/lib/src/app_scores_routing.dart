import 'package:flutter/material.dart';
import 'package:match_detail_presentation/match_detail_presentation.dart';
import 'package:scores_widgets/scores_widgets.dart';

/// Implémentation du port routing : traduit l'intention « ouvrir un match » en
/// navigation concrète vers la feature match_detail.
class AppScoresRouting implements ScoresRouting {
  const AppScoresRouting();

  @override
  void onMatchSelected(BuildContext context, String matchId) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => MatchDetailPage(matchId: matchId)),
    );
  }
}
