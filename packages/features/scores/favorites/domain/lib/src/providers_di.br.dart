import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

// Cette feature ne consomme que le domaine partagé : aucun contrat entrant propre.
@riverpod
void dummyDIFavoritesDomain(Ref _) {}
