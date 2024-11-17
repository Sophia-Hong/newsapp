import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/widgets/paper_background.dart';

class SelfScreen extends StatelessWidget {
  const SelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Growth & Reflection',
            style: GoogleFonts.notoSerif(
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            // Learning Progress Section
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Focus',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    // Learning cards will go here
                  ],
                ),
              ),
            ),

            // Time Capsule Section
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Memories',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    // Memory cards will go here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 