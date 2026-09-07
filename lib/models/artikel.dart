class Artikel {
  final int? id;
  final String judul;
  final String kategori; // Rumah Gadang, Struktur, Ukiran, Teknik Pembuatan
  final String ringkasan;
  final String kontenLengkap;
  final String gambarAsset; // path di assets/images/
  bool isFavorite;

  Artikel({
    this.id,
    required this.judul,
    required this.kategori,
    required this.ringkasan,
    required this.kontenLengkap,
    required this.gambarAsset,
    this.isFavorite = false,
  });

  factory Artikel.fromMap(Map<String, dynamic> map) {
    return Artikel(
      id: map['id'] as int?,
      judul: map['judul'] as String,
      kategori: map['kategori'] as String,
      ringkasan: map['ringkasan'] as String,
      kontenLengkap: map['kontenLengkap'] as String,
      gambarAsset: map['gambarAsset'] as String,
      isFavorite: (map['isFavorite'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'judul': judul,
      'kategori': kategori,
      'ringkasan': ringkasan,
      'kontenLengkap': kontenLengkap,
      'gambarAsset': gambarAsset,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }
}
