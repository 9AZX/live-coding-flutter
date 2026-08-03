import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition.br.freezed.dart';

/// Compétition (ligue / coupe). `colorValue` sert de pastille de marque.
@freezed
abstract class Competition with _$Competition {
  const factory Competition({
    required int colorValue,
    required String country,
    required String id,
    required String name,
  }) = _Competition;
}
