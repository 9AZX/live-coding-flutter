/// Jour affiché par le feed (onglets Hier / Aujourd'hui / Demain).
enum MatchDay {
  yesterday(-1),
  today(0),
  tomorrow(1);

  const MatchDay(this.offset);

  /// Décalage en jours par rapport à aujourd'hui.
  final int offset;
}
