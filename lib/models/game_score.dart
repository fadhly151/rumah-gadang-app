class GameScore {
  final int? id;
  final String namaGame; // 'Puzzle Ukiran', 'Mewarnai Ukiran', 'Tebak Nama Ukiran'
  final int skor;
  final String tanggal; // disimpan sebagai ISO8601 string

  GameScore({
    this.id,
    required this.namaGame,
    required this.skor,
    required this.tanggal,
  });

  factory GameScore.fromMap(Map<String, dynamic> map) {
    return GameScore(
      id: map['id'] as int?,
      namaGame: map['namaGame'] as String,
      skor: map['skor'] as int,
      tanggal: map['tanggal'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'namaGame': namaGame,
      'skor': skor,
      'tanggal': tanggal,
    };
  }
}
