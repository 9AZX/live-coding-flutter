/// Port de navigation : la feature émet des intentions / résultats / fermetures,
/// l'implémentation côté composition les traduit en navigation concrète.
/// Nommer par évènement (`on…Requested`, `on…Successful`, `onDismiss…`),
/// jamais par impératif (`navigateTo…`, `push…`).
// ignore: one_member_abstracts
abstract interface class MatchDetailRouting {
  /// L'utilisateur ferme le détail. C'est le router qui sait d'où il vient.
  void onDismissMatchDetail();
}
