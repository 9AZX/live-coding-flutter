import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_detail_presentation/src/l10n/match_detail_strings.dart';
import 'package:match_detail_presentation/src/providers_di.br.dart';
import 'package:match_detail_presentation/src/theme/match_detail_theme.br.dart';
import 'package:match_detail_presentation/src/widgets/lineup_section.dart';
import 'package:match_detail_presentation/src/widgets/match_event_tile.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:tactics_components/tactics_components.dart';

/// Détail d'une rencontre : en-tête, puis onglets Résumé / Compo.
class MatchDetailScreen extends ConsumerStatefulWidget {
  final String matchId;

  const MatchDetailScreen({required this.matchId, super.key});

  @override
  ConsumerState<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends ConsumerState<MatchDetailScreen> {
  bool _showLineups = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = ref.watch(matchDetailThemeProvider.select((theme) => theme.backgroundColor));
    final match = ref.watch(matchProvider(widget.matchId));

    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        child: match.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          // L'échec est un `ScoresError` du domaine : on affiche de la copie
          // utilisateur, jamais le `toString()` d'un type interne.
          error: (error, _) => _ErrorState(
            subtitle: error is NotFoundScoresError
                ? MatchDetailStrings.notFoundSubtitle
                : MatchDetailStrings.unavailableSubtitle,
            title: error is NotFoundScoresError
                ? MatchDetailStrings.notFoundTitle
                : MatchDetailStrings.unavailableTitle,
          ),
          data: (match) => Column(
            children: [
              _Header(match: match),
              _Tabs(
                onSelect: (showLineups) => setState(() => _showLineups = showLineups),
                showLineups: _showLineups,
              ),
              Expanded(
                child: _showLineups ? _Lineups(match: match) : _Timeline(match: match),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  final Match match;

  const _Header({required this.match});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchDetailThemeProvider.select((theme) => theme.headerTheme));

    return Container(
      color: theme.backgroundColor,
      padding: const EdgeInsets.all(TacticsSpacing.spacing400),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => ref.read(matchDetailRoutingProvider).onDismissMatchDetail(),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(right: TacticsSpacing.spacing200),
                  child: Icon(Icons.arrow_back, color: theme.teamNameTextStyle.color),
                ),
              ),
              Expanded(
                child: Text(
                  '${match.competition.name} · ${match.competition.country}',
                  style: theme.competitionTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: TacticsSpacing.spacing300),
          Row(
            children: [
              Expanded(
                child: Text(match.home.name, style: theme.teamNameTextStyle, textAlign: TextAlign.center),
              ),
              Text(
                match.hasScore ? '${match.homeScore} - ${match.awayScore}' : MatchDetailStrings.versus,
                style: theme.scoreTextStyle,
              ),
              Expanded(
                child: Text(match.away.name, style: theme.teamNameTextStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
          const SizedBox(height: TacticsSpacing.spacing200),
          Text(_statusLabel(match), style: theme.statusTextStyle),
          // Feature exposée par le marché : absente, l'en-tête ne change pas.
          ?ref.watch(matchDetailOddsFactoryProvider)?.create(match),
        ],
      ),
    );
  }
}

String _statusLabel(Match match) => switch (match.status) {
  MatchStatus.finished => MatchDetailStrings.statusFinished,
  MatchStatus.live => '${match.minute ?? 0}’',
  MatchStatus.upcoming => match.kickoff,
};

class _Tabs extends ConsumerWidget {
  final ValueChanged<bool> onSelect;
  final bool showLineups;

  const _Tabs({required this.onSelect, required this.showLineups});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchDetailThemeProvider.select((theme) => theme.tabsTheme));

    return Container(
      padding: const EdgeInsets.all(TacticsSpacing.spacing200),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Tab(
              active: !showLineups,
              label: MatchDetailStrings.tabTimeline,
              onTap: () => onSelect(false),
              theme: theme,
            ),
          ),
          const SizedBox(width: TacticsSpacing.spacing200),
          Expanded(
            child: _Tab(
              active: showLineups,
              label: MatchDetailStrings.tabLineups,
              onTap: () => onSelect(true),
              theme: theme,
            ),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final bool active;
  final String label;
  final VoidCallback onTap;
  final MatchDetailTabsTheme theme;

  const _Tab({required this.active, required this.label, required this.onTap, required this.theme});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: TacticsSpacing.spacing200),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? theme.selectedTabColor : Colors.transparent,
        borderRadius: BorderRadius.circular(TacticsRadius.pill),
      ),
      child: Text(label, style: active ? theme.activeTabTextStyle : theme.inactiveTabTextStyle),
    ),
  );
}

class _Timeline extends StatelessWidget {
  final Match match;

  const _Timeline({required this.match});

  @override
  Widget build(BuildContext context) {
    if (match.events.isEmpty) return const _EmptyTab(label: MatchDetailStrings.emptyTimeline);

    return ListView(
      children: [for (final event in match.events) MatchEventTile(event: event)],
    );
  }
}

class _Lineups extends StatelessWidget {
  final Match match;

  const _Lineups({required this.match});

  @override
  Widget build(BuildContext context) {
    if (!match.hasLineups) return const _EmptyTab(label: MatchDetailStrings.emptyLineups);

    return ListView(
      children: [for (final lineup in match.lineups) LineupSection(lineup: lineup)],
    );
  }
}

class _EmptyTab extends ConsumerWidget {
  final String label;

  const _EmptyTab({required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(matchDetailThemeProvider.select((theme) => theme.tabsTheme.emptyTextStyle));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TacticsSpacing.spacing600),
        child: Text(label, style: style, textAlign: TextAlign.center),
      ),
    );
  }
}

class _ErrorState extends ConsumerWidget {
  final String subtitle;
  final String title;

  const _ErrorState({required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(matchDetailThemeProvider.select((theme) => theme.tabsTheme));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TacticsSpacing.spacing600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off, size: 44, color: theme.emptyTextStyle.color),
            const SizedBox(height: TacticsSpacing.spacing300),
            Text(title, style: theme.activeTabTextStyle, textAlign: TextAlign.center),
            const SizedBox(height: TacticsSpacing.spacing100),
            Text(subtitle, style: theme.emptyTextStyle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
