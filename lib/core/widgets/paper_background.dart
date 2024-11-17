import 'package:flutter/material.dart';

class PaperBackground extends StatelessWidget {
  final Widget child;

  const PaperBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Solid color background for now
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        // Content
        child,
      ],
    );
  }
} 