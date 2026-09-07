import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import 'puzzle_game_screen.dart';
import 'coloring_game_screen.dart';
import 'quiz_game_screen.dart';

class GameMenuScreen extends StatelessWidget {
  const GameMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final games = [
      _GameItem(
        title: 'Puzzle Ukiran',
        subtitle: 'Susun kembali potongan gambar ukiran',
        icon: Icons.extension,
        builder: (_) => const PuzzleGameScreen(),
      ),
      _GameItem(
        title: 'Mewarnai Ukiran',
        subtitle: 'Warnai pola ukiran khas Minangkabau',
        icon: Icons.palette,
        builder: (_) => const ColoringGameScreen(),
      ),
      _GameItem(
        title: 'Tebak Nama Ukiran',
        subtitle: 'Uji pengetahuanmu tentang nama-nama motif',
        icon: Icons.quiz,
        builder: (_) => const QuizGameScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Game Edukasi')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: CircleAvatar(
                backgroundColor: AppColors.maroon,
                child: Icon(game.icon, color: Colors.white),
              ),
              title: Text(game.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(game.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: game.builder));
              },
            ),
          );
        },
      ),
    );
  }
}

class _GameItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final WidgetBuilder builder;

  _GameItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.builder,
  });
}
