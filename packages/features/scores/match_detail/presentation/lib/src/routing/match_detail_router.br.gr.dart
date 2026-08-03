// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'match_detail_router.br.dart';

/// generated route for
/// [MatchDetailPage]
class MatchDetailRoute extends PageRouteInfo<MatchDetailRouteArgs> {
  MatchDetailRoute({
    required String matchId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MatchDetailRoute.name,
         args: MatchDetailRouteArgs(matchId: matchId, key: key),
         rawPathParams: {'id': matchId},
         initialChildren: children,
       );

  static const String name = 'MatchDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MatchDetailRouteArgs>(
        orElse: () => MatchDetailRouteArgs(matchId: pathParams.getString('id')),
      );
      return MatchDetailPage(matchId: args.matchId, key: args.key);
    },
  );
}

class MatchDetailRouteArgs {
  const MatchDetailRouteArgs({required this.matchId, this.key});

  final String matchId;

  final Key? key;

  @override
  String toString() {
    return 'MatchDetailRouteArgs{matchId: $matchId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MatchDetailRouteArgs) return false;
    return matchId == other.matchId && key == other.key;
  }

  @override
  int get hashCode => matchId.hashCode ^ key.hashCode;
}
