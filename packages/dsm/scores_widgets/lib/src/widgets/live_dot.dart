import 'package:flutter/material.dart';

/// Petit point pulsant signalant un match en direct.
class LiveDot extends StatefulWidget {
  const LiveDot({required this.color, this.size = 6, super.key});

  final Color color;
  final double size;

  @override
  State<LiveDot> createState() => _LiveDotState();
}

class _LiveDotState extends State<LiveDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ponytail: pas de Semantics/respect reduce-motion ici (exercice) ; à ajouter en prod.
  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: Tween<double>(begin: 1, end: 0.2).animate(_controller),
    child: Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
    ),
  );
}
