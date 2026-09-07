class ArsipItem {
  final String judul;
  final String deskripsi;
  final String tahun;
  final String koleksi; // misal: KITLV A85
  final String lisensi; // misal: Public Domain
  final String urlSumber; // link ke halaman item di Digital Collections Leiden

  const ArsipItem({
    required this.judul,
    required this.deskripsi,
    required this.tahun,
    required this.koleksi,
    required this.lisensi,
    required this.urlSumber,
  });
}
