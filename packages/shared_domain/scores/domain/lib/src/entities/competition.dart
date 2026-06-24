/// Compétition (ligue / coupe). `colorValue` sert de pastille de marque.
class Competition {
  const Competition({
    required this.id,
    required this.name,
    required this.country,
    required this.colorValue,
  });

  final String id;
  final String name;
  final String country;
  final int colorValue;
}
