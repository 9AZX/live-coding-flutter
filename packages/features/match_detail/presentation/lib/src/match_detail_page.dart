import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_detail_presentation/src/widgets/event_tile.dart';
import 'package:match_detail_presentation/src/widgets/lineup_section.dart';
import 'package:scores_domain/scores_domain.dart';
import 'package:scores_widgets/scores_widgets.dart';
import 'package:tactics_theme/tactics_theme.dart';

enum _DetailTab { resume, compo }

/// Page détail d'un match : en-tête (score / statut), onglets Résumé et Compo.
/// Atteinte depuis n'importe quelle liste via le port routing (composition).
class MatchDetailPage extends ConsumerStatefulWidget {
  const MatchDetailPage({required this.matchId, super.key});

  final String matchId;

  @override
  ConsumerState<MatchDetailPage> createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends ConsumerState<MatchDetailPage> {
  _DetailTab _tab = _DetailTab.resume;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;
    final match = ref.watch(watchMatchProvider(widget.matchId));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: theme.palette.bgPage,
        body: match.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (match) => match == null
              ? const Center(child: Text('Match introuvable'))
              : Column(
                  children: [
                    _Header(
                      match: match,
                      tab: _tab,
                      onTab: (t) => setState(() => _tab = t),
                    ),
                    Expanded(
                      child: _tab == _DetailTab.resume ? _ResumeTab(match: match) : _CompoTab(match: match),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header({required this.match, required this.tab, required this.onTab});

  final Match match;
  final _DetailTab tab;
  final ValueChanged<_DetailTab> onTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.scoresTheme;
    final isFavorite = ref.watch(favoriteMatchIdsProvider.select((v) => v.value?.contains(match.id) ?? false));

    return ColoredBox(
      color: theme.palette.red,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
          child: Column(
            children: [
              Row(
                children: [
                  _CircleButton(icon: Icons.arrow_back, onTap: () => Navigator.of(context).pop()),
                  Expanded(
                    child: Text(
                      match.competition.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: theme.palette.fontBrand,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: theme.palette.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => ref.read(favoritesRepositoryProvider).toggleMatch(match.id),
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 34,
                      height: 34,
                      child: Center(
                        child: TacticsIcon(
                          isFavorite ? theme.palette.iconStarFull : theme.palette.iconStarEmpty,
                          size: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              _ScoreBlock(match: match),
              const SizedBox(height: 10),
              _Tabs(tab: tab, onTab: onTab),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreBlock extends StatelessWidget {
  const _ScoreBlock({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _TeamColumn(team: match.home)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              if (match.hasScore)
                Text(
                  '${match.homeScore} - ${match.awayScore}',
                  style: TextStyle(
                    fontFamily: theme.palette.fontExpanded,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 38,
                    color: theme.palette.white,
                    height: 1,
                  ),
                )
              else
                Text(
                  'VS',
                  style: TextStyle(
                    fontFamily: theme.palette.fontExpanded,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: theme.palette.white70,
                  ),
                ),
              const SizedBox(height: 8),
              _StatusLine(match: match),
            ],
          ),
        ),
        Expanded(child: _TeamColumn(team: match.away)),
      ],
    );
  }
}

class _StatusLine extends StatelessWidget {
  const _StatusLine({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;
    final label = switch (match.status) {
      MatchStatus.live => '${match.minute ?? 0}’',
      MatchStatus.finished => 'Terminé',
      MatchStatus.upcoming => match.kickoff,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (match.isLive) ...[LiveDot(color: theme.palette.white, size: 7), const SizedBox(width: 6)],
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: theme.palette.white),
        ),
      ],
    );
  }
}

class _TeamColumn extends StatelessWidget {
  const _TeamColumn({required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return Column(
      children: [
        TeamBadge(shortName: team.shortName, colorValue: team.colorValue, size: 48, fontSize: 17),
        const SizedBox(height: 8),
        Text(
          team.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: theme.palette.white),
        ),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.tab, required this.onTab});

  final _DetailTab tab;
  final ValueChanged<_DetailTab> onTab;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        _TabItem(label: 'Résumé', active: tab == _DetailTab.resume, onTap: () => onTab(_DetailTab.resume)),
        const SizedBox(width: 26),
        _TabItem(label: 'Compo', active: tab == _DetailTab.compo, onTap: () => onTab(_DetailTab.compo)),
      ],
    ),
  );
}

class _TabItem extends StatelessWidget {
  const _TabItem({required this.label, required this.active, required this.onTap});

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active ? theme.palette.white : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: active ? theme.palette.white : theme.palette.white55,
            ),
          ),
        ),
      ),
    );
  }
}

class _ResumeTab extends StatelessWidget {
  const _ResumeTab({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    if (match.events.isEmpty) {
      return EmptyState(
        icon: Icons.timer_outlined,
        title: 'Aucun évènement',
        subtitle: match.isUpcoming ? "Le match n'a pas encore commencé." : 'Aucun évènement à signaler.',
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 28),
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.palette.white,
            borderRadius: BorderRadius.circular(theme.palette.rXl),
            boxShadow: theme.palette.shadowCard,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var i = 0; i < match.events.length; i++)
                EventTile(
                  event: match.events[i],
                  match: match,
                  showDivider: i != match.events.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompoTab extends StatelessWidget {
  const _CompoTab({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    if (!match.hasLineups) {
      return const EmptyState(
        icon: Icons.groups_outlined,
        title: 'Compositions indisponibles',
        subtitle: "Communiquées avant le coup d'envoi.",
      );
    }

    return ListView(
      padding: const EdgeInsets.only(top: 4, bottom: 28),
      children: [for (final lineup in match.lineups) LineupSection(lineup: lineup)],
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.scoresTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(color: theme.palette.white16, shape: BoxShape.circle),
        child: Icon(icon, size: 18, color: theme.palette.white),
      ),
    );
  }
}
