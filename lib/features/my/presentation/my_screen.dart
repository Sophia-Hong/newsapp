import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/core/theme/theme_provider.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Text(
                'My Space',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              pinned: true,
            ),

            // Profile Section
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(DesignSystem.spacing3),
                padding: const EdgeInsets.all(DesignSystem.spacing3),
                decoration: DesignSystem.cardDecoration(context),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      child: Text(
                        'S',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    DesignSystem.hSpacing3,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sophie',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Personal Space',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        // TODO: Navigate to profile edit
                      },
                      tooltip: 'Edit profile',
                    ),
                  ],
                ),
              ),
            ),

            // Settings List
            SliverList(
              delegate: SliverChildListDelegate([
                _SettingItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  onTap: () {
                    // TODO: Navigate to notifications settings
                  },
                ),
                _SettingItem(
                  icon: Icons.palette_outlined,
                  title: 'Appearance',
                  trailing: Switch(
                    value: isDarkMode,
                    onChanged: (_) {
                      ref.read(themeProvider.notifier).toggleTheme();
                    },
                  ),
                  onTap: () {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                ),
                _SettingItem(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  onTap: () {
                    // TODO: Navigate to language settings
                  },
                ),
                _SettingItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {
                    // TODO: Navigate to help & support
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const _SettingItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: DesignSystem.spacing3,
        vertical: DesignSystem.spacing1,
      ),
      decoration: DesignSystem.cardDecoration(context),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        ),
        title: Text(title),
        trailing: trailing ?? Icon(
          Icons.chevron_right,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
        ),
      ),
    );
  }
} 