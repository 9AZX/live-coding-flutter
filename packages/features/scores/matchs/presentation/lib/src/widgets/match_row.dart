import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchs_presentation/src/l10n/matchs_strings.dart';
import 'package:matchs_presentation/src/providers_di.br.dart';
import 'package:matchs_presentation/src/theme/matchs_theme.br.dart';
import 'package:matchs_presentation/src/widgets/live_dot.dart';
import 'package:matchs_presentation/src/widgets/team_badge.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Rangée de match partagée par Matchs / En direct / Favoris.
/// Étoile → favori (domaine partagé) ; appui → détail via le port de routing.
class MatchRow extends ConsumerWidget {
  final Match match;
  final bool showDivider;

  const MatchRow({required this.match, required this.showDivider, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(
      matchsThemeProvider.select((theme) => theme.rowTheme),
    );
    final isFavorite = ref.watch(
      favoriteMatchIdsProvider.select(
        (ids) => ids.value?.contains(match.id) ?? false,
      ),
    );

    return GestureDetector(
      onTap: () => ref.read(matchsRoutingProvider).onMatchDetailRequested(match.id),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TacticsSpacing.spacing300,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          border: showDivider ? Border(bottom: BorderSide(color: theme.dividerColor)) : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 46,
              child: _StatusCell(match: match, theme: theme),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TacticsSpacing.spacing100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TeamLine(team: match.home, theme: theme),
                    const SizedBox(height: 6),
                    _TeamLine(team: match.away, theme: theme),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 24,
              child: _ScoreCell(match: match, theme: theme),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: () => ref.read(toggleFavoriteMatchProvider)(match.id),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: TacticsIcon(
                  isFavorite ? TacticsIcons.starFull : TacticsIcons.starEmpty,
                  size: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusCell extends StatelessWidget {
  final Match match;
  final MatchsRowTheme theme;

  const _StatusCell({required this.match, required this.theme});

  @override
  Widget build(BuildContext context) => switch (match.status) {
    MatchStatus.live => Column(
      children: [
        LiveDot(color: theme.liveDotColor),
        const SizedBox(height: 2),
        Text('${match.minute ?? 0}’', style: theme.liveMinuteTextStyle),
      ],
    ),
    MatchStatus.upcoming => Text(match.kickoff, style: theme.kickoffTextStyle),
    MatchStatus.finished => Text(
      MatchsStrings.statusFinished,
      style: theme.finishedTextStyle,
    ),
  };
}

class _TeamLine extends StatelessWidget {
  final Team team;
  final MatchsRowTheme theme;

  const _TeamLine({required this.team, required this.theme});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      TeamBadge(colorValue: team.colorValue, shortName: team.shortName),
      const SizedBox(width: 9),
      Expanded(
        child: Text(
          team.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.teamNameTextStyle,
        ),
      ),
    ],
  );
}

class _ScoreCell extends StatelessWidget {
  final Match match;
  final MatchsRowTheme theme;

  const _ScoreCell({required this.match, required this.theme});

  @override
  Widget build(BuildContext context) {
    if (!match.hasScore) {
      final dash = Text('-', style: theme.missingScoreTextStyle);

      return Column(children: [dash, const SizedBox(height: 6), dash]);
    }

    final style = match.isLive ? theme.liveScoreTextStyle : theme.scoreTextStyle;

    return Column(
      children: [
        Text('${match.homeScore}', style: style),
        const SizedBox(height: 6),
        Text('${match.awayScore}', style: style),
      ],
    );
  }
}
