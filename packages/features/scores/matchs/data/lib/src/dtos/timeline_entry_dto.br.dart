import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_entry_dto.br.freezed.dart';
part 'timeline_entry_dto.br.g.dart';

/// Une entrée de la timeline TheSportsDB (`/lookuptimeline`) : but, carton,
/// remplacement. Le type utile pour le domaine est déduit dans le mapper.
@freezed
abstract class TimelineEntryDto with _$TimelineEntryDto {
  const factory TimelineEntryDto({
    @JsonKey(name: 'strAssist') String? assist,
    @JsonKey(name: 'strTimelineDetail') String? detail,
    @JsonKey(name: 'strHome') String? home,
    @JsonKey(name: 'intTime') String? minute,
    @JsonKey(name: 'strPlayer') String? player,
    @JsonKey(name: 'strTimeline') String? type,
  }) = _TimelineEntryDto;

  factory TimelineEntryDto.fromJson(Map<String, dynamic> json) => _$TimelineEntryDtoFromJson(json);
}
