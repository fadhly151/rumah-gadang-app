import '../models/arsip_item.dart';

/// Daftar arsip foto lama Minangkabau dari koleksi Leiden University Libraries
/// (KITLV - Koninklijk Instituut voor Taal-, Land- en Volkenkunde) yang telah
/// diverifikasi berstatus "Public Domain" — artinya bebas diunduh, dilihat,
/// dan digunakan kembali, dengan syarat mencantumkan atribusi ke Leiden
/// University Libraries.
///
/// PENTING: Aplikasi ini TIDAK menyimpan salinan gambar aslinya (untuk
/// menghormati server & bandwidth Leiden, serta karena beberapa item butuh
/// koneksi internet untuk diverifikasi ulang statusnya). Setiap kartu akan
/// membuka halaman resmi item tersebut di browser, tempat pengguna bisa
/// melihat & mengunduh gambar resolusi tinggi secara langsung dari sumbernya.
///
/// Untuk menambah item baru: buka https://digitalcollections.universiteitleiden.nl,
/// cari dengan kata kunci "Minangkabau", buka halaman itemnya, lalu cek bagian
/// "Use and reproduction" — hanya tambahkan ke daftar ini jika tertulis
/// "The rights status of this resource is public domain."
List<ArsipItem> sampleArsipList() {
  return [
    ArsipItem(
      judul: 'Minangkabau huis, rumah gadang, op Sumatra\'s Westkust',
      deskripsi:
          'Foto Rumah Gadang di pesisir barat Sumatra, bagian dari album '
          '"Souvenir aan Indië" persembahan surat kabar Java-Bode.',
      tahun: 'Sekitar 1930',
      koleksi: 'KITLV A85',
      lisensi: 'Public Domain',
      urlSumber: 'https://digitalcollections.universiteitleiden.nl/view/item/926694',
    ),
    ArsipItem(
      judul: 'Minangkabau huis (roemah gadang) te Kampong Andalas',
      deskripsi:
          'Foto Rumah Gadang di Kampung Andalas, diambil dari catatan '
          'perjalanan "Reis door Sumatra in 1936" oleh seorang pelancong '
          'asal Groningen, Belanda.',
      tahun: '1936',
      koleksi: 'KITLV A1369',
      lisensi: 'Public Domain',
      urlSumber: 'https://digitalcollections.universiteitleiden.nl/view/item/902470',
    ),
    ArsipItem(
      judul: 'Minangkabau vrouwen voor een huis op West-Sumatra',
      deskripsi:
          'Foto sekelompok perempuan Minangkabau berbusana adat di depan '
          'sebuah rumah, difoto oleh studio C. Nieuwenhuis di Padang.',
      tahun: 'Sekitar 1910',
      koleksi: 'KITLV A85',
      lisensi: 'Public Domain',
      urlSumber: 'https://digitalcollections.universiteitleiden.nl/view/item/927865',
    ),
  ];
}

/// Tautan umum ke portal & katalog Leiden untuk penelusuran lebih lanjut
/// (foto tambahan, manuskrip, dan koleksi khusus Asia Tenggara), termasuk
/// yang aksesnya bervariasi (sebagian bebas, sebagian perlu akses khusus).
class ArsipPortalLink {
  final String judul;
  final String deskripsi;
  final String url;

  const ArsipPortalLink({required this.judul, required this.deskripsi, required this.url});
}

List<ArsipPortalLink> arsipPortalLinks() {
  return [
    const ArsipPortalLink(
      judul: 'Koleksi Foto Asia Tenggara (KITLV)',
      deskripsi:
          'Sekitar 220.000 foto, termasuk banyak foto Sumatera Barat & '
          'Minangkabau era 1850–1950. Cari dengan kata kunci "Minangkabau".',
      url: 'https://digitalcollections.universiteitleiden.nl/imagecollection-kitlv',
    ),
    const ArsipPortalLink(
      judul: 'Katalog Manuskrip Melayu & Minangkabau',
      deskripsi:
          'Katalog referensi manuskrip Melayu, Minangkabau, dan Sumatra '
          'Selatan yang tersimpan di Belanda.',
      url: 'https://digitalcollections.universiteitleiden.nl/view/item/103137',
    ),
    const ArsipPortalLink(
      judul: 'Panduan Koleksi Khusus Asia Tenggara',
      deskripsi:
          'Halaman resmi Leiden University Libraries berisi ringkasan '
          'seluruh koleksi manuskrip & foto Asia Tenggara, termasuk Minangkabau.',
      url: 'https://www.library.universiteitleiden.nl/subject-guides/southeast-asian-special-collections',
    ),
  ];
}
