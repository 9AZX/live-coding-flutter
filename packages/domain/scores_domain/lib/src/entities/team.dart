/// Équipe. `colorValue` est la couleur de marque (ARGB) fournie par la donnée.
class Team {
  const Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.colorValue,
  });

  final String id;
  final String name;
  final String shortName;
  final int colorValue;
}
