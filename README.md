# Rumah Gadang App

Aplikasi ensiklopedia & edukasi budaya Minangkabau: Rumah Gadang, ukiran,
struktur bangunan, dan teknik pembuatannya — dilengkapi login sederhana,
mode offline, dan 3 game edukasi ringan.

## Struktur Project

```
lib/
  main.dart                     # Entry point (inisialisasi Firebase)
  firebase_options.dart         # PLACEHOLDER - ganti via `flutterfire configure`
  models/                       # Artikel, GameScore, ArsipItem
  services/
    auth_service.dart           # Wrapper Firebase Auth (login/daftar/logout)
  data/
    local_database.dart         # SQLite offline (sqflite)
    sample_content.dart         # Seed data ensiklopedia (22 motif ukiran + lainnya)
    sample_arsip.dart           # Seed data Arsip Leiden/KITLV
  screens/
    splash_screen.dart
    login_screen.dart           # Login & Daftar via Firebase Auth
    home_screen.dart            # Bottom nav 5 tab
    content_list_screen.dart    # List + search + filter kategori
    content_detail_screen.dart  # Detail artikel + favorit
    favorite_screen.dart
    arsip_screen.dart           # Arsip foto lama Minangkabau (Leiden/KITLV)
    profile_screen.dart
    games/
      game_menu_screen.dart
      puzzle_game_screen.dart      # Puzzle susun gambar 3x3/4x4
      coloring_game_screen.dart    # Mewarnai bebas (freehand) + undo
      quiz_game_screen.dart        # Tebak nama ukiran + timer + skor terbaik
  widgets/
    content_card.dart
    category_chip.dart
    marawa_flag_icon.dart       # Ikon bendera Marawa (branding)
  utils/
    theme.dart                  # Warna Marawa (hitam, merah, kuning)
    constants.dart
assets/
  icon/
    app_icon.png                 # Sumber ikon aplikasi (untuk flutter_launcher_icons)
  images/                       # Taruh gambar rumah gadang & ukiran di sini
  data/                         # (opsional) untuk konten tambahan berbasis JSON
.github/workflows/
  build-apk.yml                 # GitHub Actions: build APK otomatis
```

## Cara Menjalankan

1. Install [Flutter SDK](https://flutter.dev) (versi stabil terbaru) & Android Studio.
2. Copy folder project ini ke komputer kamu, lalu buka terminal di dalamnya.
3. Jalankan:
   ```
   flutter pub get
   flutter run
   ```
4. Aplikasi akan otomatis mengisi (seed) 8 artikel contoh saat pertama kali dibuka.

## Status Konten & Game (Update Terbaru)

- **Konten ensiklopedia** di `sample_content.dart` sudah diisi hasil riset awal
  (dirangkum & ditulis ulang dari Tambo Alam Minangkabau, jurnal ragam hias,
  dan artikel filosofi adat) — sudah lebih dari sekadar draf `TODO`. Tetap
  disarankan divalidasi ulang oleh budayawan/pemangku adat setempat sebelum
  rilis publik, karena tiap nagari kadang punya versi cerita yang sedikit
  berbeda.
- Total motif/ragam ukiran kini **22 buah**. Tahap riset lanjutan (2x
  "gali lebih dalam") menambahkan: Aka Cino, Carano Kanso, Lumuik Anyuik,
  Limpapeh, Si Kambang Manih, Rajo Tigo Selo, **Pisang Sasikek, Buah Palo
  Bapatah, Aka Basaua, Kudo Manyipak Dalam Kandang, Sajamba Makan, Siriah
  Gadang, Ramo-Ramo Si Kumbang Janti**.
- Sumber utama: jurnal "Makna Ornamen Rumah Gadang Minangkabau: Kajian
  Semantik" (Humanika Vol. 27, Universitas Diponegoro), blog etnografi
  StudioZodio (ulasan per-motif), dan beberapa artikel budaya lain — semua
  ditulis ulang dengan bahasa sendiri, bukan kutipan langsung.
- Nama-nama motif yang masih teridentifikasi namun makna filosofisnya belum
  cukup jelas/konsisten antar sumber (belum dimasukkan): Aka Cino Saganggang
  (varian lain dari Aka Cino), Lapiah Batang Jarami, Labah Mangirok, Tupai
  Managun, Tatandu Manyasok Bungo, Aka Duo Gagang, Aka Taranang, Ayam
  Mancotok dalam Kandang, Harimau dalam Parangkok, Aia Bapesong, Jarek
  Takambang, Kaluak Baralun, Ati-ati, Ambun Dewi, dan beberapa lainnya.
- **Puzzle Ukiran**: sekarang punya pilihan tingkat kesulitan 3x3 (Mudah)
  dan 4x4 (Sulit), serta menampilkan skor terbaik.
- **Tebak Nama Ukiran**: soal ditambah (kini mencakup 4 motif), dan
  menampilkan skor terbaik di layar hasil akhir.
- **Mewarnai Ukiran**: ditambah tombol Undo untuk menghapus goresan terakhir.

## Modul Arsip Leiden (Baru)

Tab kelima **"Arsip"** menampilkan katalog foto lama Minangkabau dari koleksi
**KITLV / Leiden University Libraries** yang sudah diverifikasi berstatus
**Public Domain** (bebas dilihat & diunduh, cukup cantumkan atribusi ke
Leiden University Libraries):

- `Minangkabau huis, rumah gadang, op Sumatra's Westkust` — KITLV A85, ±1930
- `Minangkabau huis (roemah gadang) te Kampong Andalas` — KITLV A1369, 1936
- `Minangkabau vrouwen voor een huis op West-Sumatra` — KITLV A85, ±1910

**Cara kerja modul ini:** aplikasi TIDAK menyalin/menyimpan file gambar
aslinya ke dalam aset aplikasi. Setiap kartu di tab Arsip membuka browser
menuju halaman resmi item tersebut di `digitalcollections.universiteitleiden.nl`,
tempat pengguna bisa melihat & mengunduh gambar resolusi tinggi langsung dari
sumbernya. Alasannya: (1) menghormati bandwidth & server Leiden, (2) status
hak cipta tiap item bisa berubah/perlu diverifikasi ulang dari waktu ke
waktu, (3) menghindari isu distribusi ulang massal tanpa izin eksplisit.

Ada juga bagian "Jelajahi Lebih Banyak" berisi tautan portal resmi (koleksi
foto KITLV ~220.000 gambar, katalog manuskrip Melayu-Minangkabau, dan
panduan koleksi Asia Tenggara) untuk pengguna yang ingin riset lebih dalam.

**Cara menambah item arsip baru** (lihat komentar di
`lib/data/sample_arsip.dart`): buka digitalcollections.universiteitleiden.nl,
cari "Minangkabau", buka halaman item, cek bagian "Use and reproduction" —
hanya tambahkan ke daftar jika tertulis "public domain".

Dependency baru: `url_launcher` (untuk membuka tautan di browser eksternal).

## 🔥 Setup Firebase Auth (Wajib Sebelum Menjalankan App)

Login sekarang pakai **Firebase Authentication** (email & password) — bukan
lagi login lokal. Ada mode Login & Daftar di satu layar yang sama
(`lib/screens/login_screen.dart`), dibungkus rapi lewat
`lib/services/auth_service.dart`.

**Langkah setup (sekali saja, di komputer kamu):**
1. Buka https://console.firebase.google.com → buat project baru (gratis).
2. Di menu **Authentication → Sign-in method**, aktifkan provider
   **Email/Password**.
3. Install FlutterFire CLI (sekali saja di komputer):
   ```
   dart pub global activate flutterfire_cli
   ```
4. Di root folder project ini (folder hasil ekstrak zip), jalankan:
   ```
   flutterfire configure
   ```
   Pilih project Firebase yang baru dibuat, dan pilih platform **android**.
   Perintah ini otomatis:
   - Mengganti isi `lib/firebase_options.dart` (yang sekarang masih
     **placeholder**) dengan konfigurasi asli project kamu.
   - Menambahkan file `android/app/google-services.json`.
   - Menambahkan plugin Google Services ke file gradle Android.
5. Jalankan `flutter pub get`, lalu `flutter run`.

⚠️ **Jangan lewati langkah ini** — kalau `firebase_options.dart` masih
placeholder, aplikasi akan error saat dibuka karena tidak terhubung ke
project Firebase manapun.

## 🎨 Ikon Aplikasi

Ikon bertema Marawa (rumah gadang + gonjong, warna hitam/merah/kuning) sudah
digenerate di `assets/icon/app_icon.png`, dan sudah dikonfigurasi lewat
package `flutter_launcher_icons` di `pubspec.yaml`.

Untuk menerapkannya ke seluruh ukuran ikon Android:
```
flutter pub get
dart run flutter_launcher_icons
```
Ganti `assets/icon/app_icon.png` dengan desain lain kapan saja lalu jalankan
ulang perintah di atas jika ingin ikon yang berbeda.

## 🚀 Build APK Otomatis Lewat GitHub

Sudah disiapkan workflow **GitHub Actions** di
`.github/workflows/build-apk.yml` yang otomatis build APK setiap kali kamu
push ke branch `main` (atau dipicu manual lewat tab **Actions**).

**Cara pakai:**
1. Buat repository baru di GitHub (bisa privat atau publik).
2. Di folder project ini, jalankan:
   ```
   git init
   git add .
   git commit -m "Initial commit: Rumah Gadang App"
   git branch -M main
   git remote add origin https://github.com/USERNAME/NAMA_REPO.git
   git push -u origin main
   ```
3. Buka tab **Actions** di repo GitHub kamu — workflow "Build APK" akan
   otomatis berjalan.
4. Setelah selesai (biasanya 3–8 menit), buka hasil run tersebut, scroll ke
   bagian **Artifacts**, lalu unduh `rumah-gadang-app-release-apk` — di
   dalamnya ada file `app-release.apk` yang siap diinstal ke HP Android.

**Catatan penting:**
- Kalau folder `android/` belum ada di repo, workflow otomatis menjalankan
  `flutter create --platforms=android .` untuk membuatnya. Ini cukup untuk
  **testing pribadi**, tapi APK yang dihasilkan masih pakai applicationId
  default (`com.example.rumah_gadang_app`) — **ganti ini sebelum rilis ke
  Play Store** (lihat `android/app/build.gradle`, cari `applicationId`).
- Supaya Firebase Auth ikut berfungsi di APK hasil build GitHub Actions,
  jalankan `flutterfire configure` di komputer kamu dulu (lihat bagian
  Firebase di atas), lalu **commit folder `android/` beserta
  `google-services.json` dan `lib/firebase_options.dart` yang sudah terisi
  asli** sebelum push ke GitHub — jangan andalkan workflow untuk membuatnya
  otomatis kalau Firebase ingin ikut jalan.
- Kalau repo publik, sebaiknya jangan commit `google-services.json` secara
  bebas (lihat catatan di `.gitignore`) — untuk tahap testing pribadi/repo
  privat, ini umumnya aman karena isinya hanya konfigurasi klien, bukan
  kredensial rahasia.

## Yang Masih Perlu Dilengkapi Sebelum Rilis

- **Gambar asli**: semua path gambar di `sample_content.dart` dan layar game
  masih placeholder (`assets/images/...jpg`). Tambahkan file gambar asli
  dengan nama yang sama, atau ubah nama filenya sesuai aset kamu.
- **Konten**: sebagian besar sudah diriset (lihat bagian "Status Konten &
  Game" di atas), namun tetap disarankan divalidasi ulang oleh budayawan
  atau pemangku adat setempat sebelum rilis publik final.
- **Firebase**: sudah terintegrasi di sisi kode, tapi kamu WAJIB menjalankan
  `flutterfire configure` sendiri (lihat bagian Firebase di atas) sebelum
  aplikasi bisa dijalankan — project ini tidak menyertakan project Firebase
  sungguhan.
- **Game Mewarnai**: versi saat ini adalah kanvas gambar bebas (freehand).
  Untuk pengalaman "mewarnai sesuai pola" yang lebih baik, pertimbangkan
  pewarnaan per-region (flood fill) menggunakan SVG per motif ukiran.
- **applicationId**: sebelum rilis Play Store, ganti applicationId default
  di `android/app/build.gradle` (lihat bagian Build APK di atas).

## Roadmap Saran

1. **Fase 1 (sekarang)** — Testing pribadi: lengkapi konten & gambar asli.
2. **Fase 2** — Tambah backend ringan (Firebase Auth + Firestore/Storage)
   agar konten bisa diupdate tanpa update aplikasi, dan progress game
   tersimpan per akun.
3. **Fase 3** — Rilis ke Play Store: siapkan ikon, screenshot, deskripsi
   store listing, dan uji di beberapa ukuran layar device.
