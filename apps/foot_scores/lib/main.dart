import 'package:composition_root/composition_root.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foot_scores/app.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: scoresAppOverrides(),
      child: const FootScoresApp(),
    ),
  );
}
