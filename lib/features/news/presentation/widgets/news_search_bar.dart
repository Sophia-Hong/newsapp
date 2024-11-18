import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';

class NewsSearchBar extends StatelessWidget {
  const NewsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Center(
        child: TextField(
          style: Theme.of(context).textTheme.bodyMedium,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Find something interest in myself',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            prefixIcon: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spacing2,
                vertical: DesignSystem.spacing2,
              ),
              child: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                size: 20,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
              right: DesignSystem.spacing3,
            ),
          ),
        ),
      ),
    );
  }
} 