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
        // Paper grain effect
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            image: DecorationImage(
              image: const AssetImage('assets/images/paper_grain.png'),
              repeat: ImageRepeat.repeat,
              opacity: 0.03, // Very subtle grain
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                BlendMode.multiply,
              ),
            ),
          ),
        ),
        // Content
        child,
      ],
    );
  }
} 