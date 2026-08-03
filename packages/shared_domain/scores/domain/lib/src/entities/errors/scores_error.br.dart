import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_error.br.freezed.dart';

/// Échecs métier du feed, exprimés côté domaine : la présentation branche sur ces
/// cas-là, jamais sur une exception réseau. Un cas par message affichable.
@freezed
sealed class ScoresError with _$ScoresError {
  const factory ScoresError.notFound() = NotFoundScoresError;

  const factory ScoresError.unavailable() = UnavailableScoresError;
}
