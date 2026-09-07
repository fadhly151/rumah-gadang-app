import 'package:flutter/material.dart';
import 'theme.dart';

/// Ikon bendera Marawa: tiga umbul-umbul segitiga berwarna hitam, kuning,
/// merah — dipakai sebagai elemen branding di splash & login screen
/// sebagai pengganti ikon generik.
class MarawaFlagIcon extends StatelessWidget {
  final double size;

  const MarawaFlagIcon({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _MarawaFlagPainter()),
    );
  }
}

class _MarawaFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final flagWidth = size.width / 3;
    final colors = [AppColors.black, AppColors.gold, AppColors.maroon];

    for (int i = 0; i < 3; i++) {
      final paint = Paint()..color = colors[i];
      final path = Path();
      final left = i * flagWidth;
      // Bentuk umbul-umbul: persegi panjang atas dengan ujung runcing (segitiga) di bawah,
      // menyerupai bendera Marawa yang dikibarkan berjajar.
      path.moveTo(left, 0);
      path.lineTo(left + flagWidth * 0.85, 0);
      path.lineTo(left + flagWidth * 0.85, size.height * 0.55);
      path.lineTo(left + flagWidth * 0.425, size.height);
      path.lineTo(left, size.height * 0.55);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MarawaFlagPainter oldDelegate) => false;
}
