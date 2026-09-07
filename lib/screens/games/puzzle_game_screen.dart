import 'dart:math';
import 'package:flutter/material.dart';
import '../../data/local_database.dart';
import '../../models/game_score.dart';
import '../../utils/theme.dart';

/// Puzzle geser sederhana: gambar dibagi menjadi grid NxN, posisi diacak,
/// pemain menyusun kembali dengan cara tap dua potongan untuk menukar posisi.
/// Ganti [_imageAsset] dengan aset ukiran asli sebelum rilis.
class PuzzleGameScreen extends StatefulWidget {
  const PuzzleGameScreen({super.key});

  @override
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  int gridSize = 3; // 3x3 (mudah) atau 4x4 (sulit)
  static const String _imageAsset = 'assets/images/ukiran_kaluak_paku.jpg';

  late List<int> _order; // posisi index potongan saat ini
  int? _selectedIndex;
  int _moves = 0;
  bool _won = false;
  int? _bestScore;

  @override
  void initState() {
    super.initState();
    _shuffle();
    _loadBestScore();
  }

  Future<void> _loadBestScore() async {
    final scores = await LocalDatabase.instance.getScoresByGame('Puzzle Ukiran');
    if (!mounted || scores.isEmpty) return;
    setState(() => _bestScore = scores.first.skor);
  }

  void _changeDifficulty(int newSize) {
    setState(() {
      gridSize = newSize;
      _shuffle();
    });
  }

  void _shuffle() {
    final total = gridSize * gridSize;
    _order = List.generate(total, (i) => i);
    _order.shuffle(Random());
    _moves = 0;
    _won = false;
  }

  void _onTapPiece(int tappedPos) {
    if (_won) return;
    setState(() {
      if (_selectedIndex == null) {
        _selectedIndex = tappedPos;
      } else if (_selectedIndex == tappedPos) {
        _selectedIndex = null;
      } else {
        final tmp = _order[_selectedIndex!];
        _order[_selectedIndex!] = _order[tappedPos];
        _order[tappedPos] = tmp;
        _selectedIndex = null;
        _moves++;
        _checkWin();
      }
    });
  }

  void _checkWin() {
    for (int i = 0; i < _order.length; i++) {
      if (_order[i] != i) return;
    }
    _won = true;
    final basePoints = gridSize == 4 ? 150 : 100;
    final skor = (basePoints - _moves * 2).clamp(10, basePoints);
    LocalDatabase.instance.insertScore(
      GameScore(
        namaGame: 'Puzzle Ukiran',
        skor: skor,
        tanggal: DateTime.now().toIso8601String(),
      ),
    );
    _loadBestScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Puzzle Ukiran')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Mudah (3x3)'),
                  selected: gridSize == 3,
                  onSelected: (_) => _changeDifficulty(3),
                  selectedColor: AppColors.maroon,
                  labelStyle: TextStyle(color: gridSize == 3 ? Colors.white : AppColors.black),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Sulit (4x4)'),
                  selected: gridSize == 4,
                  onSelected: (_) => _changeDifficulty(4),
                  selectedColor: AppColors.maroon,
                  labelStyle: TextStyle(color: gridSize == 4 ? Colors.white : AppColors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Langkah: $_moves', style: const TextStyle(fontSize: 16)),
                if (_bestScore != null) ...[
                  const SizedBox(width: 16),
                  Text('Skor Terbaik: $_bestScore', style: TextStyle(color: Colors.grey[700])),
                ],
              ],
            ),
          ),
          if (_won)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '🎉 Selamat! Puzzle berhasil disusun.',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridSize,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: gridSize * gridSize,
                    itemBuilder: (context, pos) {
                      final pieceIndex = _order[pos];
                      final selected = _selectedIndex == pos;
                      return GestureDetector(
                        onTap: () => _onTapPiece(pos),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selected ? AppColors.gold : Colors.white,
                              width: selected ? 3 : 1,
                            ),
                          ),
                          child: _PuzzlePiece(
                            imageAsset: _imageAsset,
                            gridSize: gridSize,
                            pieceIndex: pieceIndex,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () => setState(_shuffle),
              icon: const Icon(Icons.refresh),
              label: const Text('Acak Ulang'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Menampilkan satu potongan [pieceIndex] dari gambar penuh yang dibagi
/// menjadi grid [gridSize] x [gridSize].
class _PuzzlePiece extends StatelessWidget {
  final String imageAsset;
  final int gridSize;
  final int pieceIndex;

  const _PuzzlePiece({
    required this.imageAsset,
    required this.gridSize,
    required this.pieceIndex,
  });

  @override
  Widget build(BuildContext context) {
    final row = pieceIndex ~/ gridSize;
    final col = pieceIndex % gridSize;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cellSize = constraints.maxWidth;
        return ClipRect(
          child: Align(
            alignment: Alignment(
              gridSize == 1 ? 0 : (col / (gridSize - 1)) * 2 - 1,
              gridSize == 1 ? 0 : (row / (gridSize - 1)) * 2 - 1,
            ),
            child: OverflowBox(
              maxWidth: cellSize * gridSize,
              maxHeight: cellSize * gridSize,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.gold.withOpacity(0.3 + (pieceIndex % 3) * 0.15),
                  child: Center(child: Text('${pieceIndex + 1}')),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
