import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../data/local_database.dart';
import '../../models/game_score.dart';
import '../../utils/theme.dart';

class _QuizQuestion {
  final String gambarAsset;
  final String jawabanBenar;
  final List<String> pilihan;

  _QuizQuestion({
    required this.gambarAsset,
    required this.jawabanBenar,
    required this.pilihan,
  });
}

/// TODO: pindahkan pertanyaan ini ke tabel database / JSON agar mudah
/// ditambah tanpa mengubah kode, dan lengkapi dengan gambar asli.
List<_QuizQuestion> _buildQuestions() {
  return [
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_kaluak_paku.jpg',
      jawabanBenar: 'Kaluak Paku',
      pilihan: ['Kaluak Paku', 'Itiak Pulang Patang', 'Bada Mudiak', 'Pucuk Rebung'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_itiak_pulang_patang.jpg',
      jawabanBenar: 'Itiak Pulang Patang',
      pilihan: ['Kaluak Paku', 'Itiak Pulang Patang', 'Bada Mudiak', 'Pucuk Rebung'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_bada_mudiak.jpg',
      jawabanBenar: 'Bada Mudiak',
      pilihan: ['Bada Mudiak', 'Itiak Pulang Patang', 'Kaluak Paku', 'Pucuk Rebung'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_pucuk_rebung.jpg',
      jawabanBenar: 'Pucuk Rebung',
      pilihan: ['Pucuk Rebung', 'Itiak Pulang Patang', 'Bada Mudiak', 'Kaluak Paku'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_kuciang_lalok.jpg',
      jawabanBenar: 'Kuciang Lalok',
      pilihan: ['Kuciang Lalok', 'Saik Galamai', 'Jalo Taserak', 'Saluak Laka'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_saik_galamai.jpg',
      jawabanBenar: 'Saik Galamai',
      pilihan: ['Saik Galamai', 'Kuciang Lalok', 'Tangguak Lamah', 'Jalo Taserak'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_limpapeh.jpg',
      jawabanBenar: 'Limpapeh',
      pilihan: ['Limpapeh', 'Si Kambang Manih', 'Aka Cino', 'Carano Kanso'],
    ),
    _QuizQuestion(
      gambarAsset: 'assets/images/ukiran_carano_kanso.jpg',
      jawabanBenar: 'Carano Kanso',
      pilihan: ['Carano Kanso', 'Lumuik Anyuik', 'Limpapeh', 'Aka Cino'],
    ),
  ];
}

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({super.key});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  late List<_QuizQuestion> _questions;
  int _current = 0;
  int _score = 0;
  int _secondsLeft = 15;
  Timer? _timer;
  String? _selectedAnswer;
  bool _answered = false;
  bool _finished = false;
  int? _bestScore;

  @override
  void initState() {
    super.initState();
    _questions = _buildQuestions()..shuffle(Random());
    _startTimer();
  }

  Future<void> _loadBestScore() async {
    final scores = await LocalDatabase.instance.getScoresByGame('Tebak Nama Ukiran');
    if (!mounted || scores.isEmpty) return;
    setState(() => _bestScore = scores.first.skor);
  }

  void _startTimer() {
    _secondsLeft = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        _timer?.cancel();
        _handleAnswer(null); // waktu habis, dianggap salah
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _handleAnswer(String? pilihan) {
    if (_answered) return;
    _timer?.cancel();
    final benar = pilihan == _questions[_current].jawabanBenar;
    setState(() {
      _selectedAnswer = pilihan;
      _answered = true;
      if (benar) _score += 10;
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      if (_current < _questions.length - 1) {
        setState(() {
          _current++;
          _selectedAnswer = null;
          _answered = false;
        });
        _startTimer();
      } else {
        setState(() => _finished = true);
        LocalDatabase.instance.insertScore(
          GameScore(
            namaGame: 'Tebak Nama Ukiran',
            skor: _score,
            tanggal: DateTime.now().toIso8601String(),
          ),
        );
        _loadBestScore();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_finished) {
      return Scaffold(
        appBar: AppBar(title: const Text('Tebak Nama Ukiran')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 64, color: AppColors.gold),
              const SizedBox(height: 12),
              Text('Skor Akhir: $_score', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              if (_bestScore != null) ...[
                const SizedBox(height: 6),
                Text('Skor Terbaik: $_bestScore', style: TextStyle(color: Colors.grey[700])),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Kembali ke Menu Game'),
              ),
            ],
          ),
        ),
      );
    }

    final question = _questions[_current];
    return Scaffold(
      appBar: AppBar(title: Text('Soal ${_current + 1}/${_questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: _secondsLeft / 15,
              color: AppColors.maroon,
              backgroundColor: AppColors.gold.withOpacity(0.2),
            ),
            const SizedBox(height: 8),
            Text('Waktu: $_secondsLeft detik', style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                question.gambarAsset,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: AppColors.gold.withOpacity(0.3),
                  child: const Icon(Icons.image_not_supported_outlined, size: 48),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Apa nama motif ukiran ini?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: question.pilihan.map((opsi) {
                  Color? tileColor;
                  if (_answered) {
                    if (opsi == question.jawabanBenar) {
                      tileColor = Colors.green.withOpacity(0.2);
                    } else if (opsi == _selectedAnswer) {
                      tileColor = Colors.red.withOpacity(0.2);
                    }
                  }
                  return Card(
                    color: tileColor,
                    child: ListTile(
                      title: Text(opsi),
                      onTap: _answered ? null : () => _handleAnswer(opsi),
                    ),
                  );
                }).toList(),
              ),
            ),
            Text('Skor sementara: $_score'),
          ],
        ),
      ),
    );
  }
}
