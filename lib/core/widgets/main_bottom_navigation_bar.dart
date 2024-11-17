import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
          ),
        ),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        height: 65,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          _buildDestination(
            context,
            label: 'Today',
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            isSelected: currentIndex == 0,
          ),
          _buildDestination(
            context,
            label: 'News',
            icon: Icons.article_outlined,
            selectedIcon: Icons.article_rounded,
            isSelected: currentIndex == 1,
          ),
          _buildDestination(
            context,
            label: 'Self',
            icon: Icons.auto_awesome_outlined,
            selectedIcon: Icons.auto_awesome,
            isSelected: currentIndex == 2,
          ),
          _buildDestination(
            context,
            label: 'My',
            icon: Icons.person_outline,
            selectedIcon: Icons.person_rounded,
            isSelected: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  NavigationDestination _buildDestination(
    BuildContext context, {
    required String label,
    required IconData icon,
    required IconData selectedIcon,
    required bool isSelected,
  }) {
    final color = isSelected 
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.5);

    return NavigationDestination(
      icon: Icon(
        icon,
        color: color,
        size: 24,
      ),
      selectedIcon: Icon(
        selectedIcon,
        color: color,
        size: 24,
      ),
      label: label,
    );
  }
} 