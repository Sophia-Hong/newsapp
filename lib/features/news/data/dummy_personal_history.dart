import 'package:newsapp/features/news/domain/personal_history_model.dart';

final List<PersonalHistoryEntry> dummyPersonalHistory = [
  PersonalHistoryEntry(
    id: '1',
    title: 'First Flutter App Launch',
    imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=800&q=80',
    originalDate: DateTime.now().subtract(const Duration(days: 365)),
    category: 'Achievement',
    description: 'Successfully launched my first Flutter app after months of learning.',
  ),
  PersonalHistoryEntry(
    id: '2',
    title: 'Started Daily Meditation',
    imageUrl: 'https://images.unsplash.com/photo-1545389336-cf090694435e?auto=format&fit=crop&w=800&q=80',
    originalDate: DateTime.now().subtract(const Duration(days: 730)),
    category: 'Wellness',
    description: 'Began my mindfulness journey with daily meditation practice.',
  ),
  PersonalHistoryEntry(
    id: '3',
    title: 'First Design Workshop',
    imageUrl: 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?auto=format&fit=crop&w=800&q=80',
    originalDate: DateTime.now().subtract(const Duration(days: 548)),
    category: 'Learning',
    description: 'Led my first UX design workshop for the community.',
  ),
  PersonalHistoryEntry(
    id: '4',
    title: 'Piano Recital',
    imageUrl: 'https://images.unsplash.com/photo-1552422535-c45813c61732?auto=format&fit=crop&w=800&q=80',
    originalDate: DateTime.now().subtract(const Duration(days: 183)),
    category: 'Achievement',
    description: 'Performed my first piano piece in public.',
  ),
  PersonalHistoryEntry(
    id: '5',
    title: 'Started MyJourney Blog',
    imageUrl: 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?auto=format&fit=crop&w=800&q=80',
    originalDate: DateTime.now().subtract(const Duration(days: 274)),
    category: 'Writing',
    description: 'Launched my personal tech blog to share learning journey.',
  ),
]; 