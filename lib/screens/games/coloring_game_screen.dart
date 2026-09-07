import 'package:flutter/material.dart';
import '../../utils/theme.dart';

/// Mewarnai ukiran versi awal: kanvas gambar bebas (freehand) di atas
/// sketsa panduan (outline) ukiran. Untuk versi lanjutan, bisa diganti
/// dengan pewarnaan per-region (flood fill) menggunakan SVG per motif.
class ColoringGameScreen extends StatefulWidget {
  const ColoringGameScreen({super.key});

  @override
  State<ColoringGameScreen> createState() => _ColoringGameScreenState();
}

class _ColoringGameScreenState extends State<ColoringGameScreen> {
  static const String _outlineAsset = 'assets/images/ukiran_outline_mewarnai.png';

  final List<_Stroke> _strokes = [];
  Color _selectedColor = AppColors.maroon;
  double _brushSize = 12;

  final List<Color> _palette = const [
    AppColors.maroon,
    AppColors.gold,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.black,
  ];

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _strokes.add(_Stroke(color: _selectedColor, width: _brushSize, points: [details.localPosition]));
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _strokes.last.points.add(details.localPosition);
    });
  }

  void _clearCanvas() {
    setState(() => _strokes.clear());
  }

  void _undoLastStroke() {
    if (_strokes.isEmpty) return;
    setState(() => _strokes.removeLast());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mewarnai Ukiran'),
        actions: [
          IconButton(icon: const Icon(Icons.undo), onPressed: _undoLastStroke),
          IconButton(icon: const Icon(Icons.delete_outline), onPressed: _clearCanvas),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.gold, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onPanStart: _onPanStart,
                  onPanUpdate: _onPanUpdate,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CustomPaint(painter: _ColoringPainter(_strokes)),
                      // Sketsa panduan di atas, hanya garis hitam yang terlihat
                      // (pastikan file PNG punya background transparan).
                      Image.asset(
                        _outlineAsset,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('Ukuran kuas:'),
                Expanded(
                  child: Slider(
                    value: _brushSize,
                    min: 4,
                    max: 30,
                    activeColor: AppColors.maroon,
                    onChanged: (v) => setState(() => _brushSize = v),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: _palette.map((color) {
                final selected = color == _selectedColor;
                return GestureDetector(
                  onTap: () => setState(() => _selectedColor = color),
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? AppColors.black : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _Stroke {
  final Color color;
  final double width;
  final List<Offset> points;

  _Stroke({required this.color, required this.width, required this.points});
}

class _ColoringPainter extends CustomPainter {
  final List<_Stroke> strokes;
  _ColoringPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..color = stroke.color
        ..strokeWidth = stroke.width
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      for (int i = 0; i < stroke.points.length - 1; i++) {
        canvas.drawLine(stroke.points[i], stroke.points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ColoringPainter oldDelegate) => true;
}
