import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/artikel.dart';
import '../models/game_score.dart';

/// Singleton helper untuk semua akses database lokal (offline-first).
/// Semua konten, status favorit, dan skor game disimpan di device.
class LocalDatabase {
  LocalDatabase._internal();
  static final LocalDatabase instance = LocalDatabase._internal();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'rumah_gadang.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE artikel (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            judul TEXT NOT NULL,
            kategori TEXT NOT NULL,
            ringkasan TEXT NOT NULL,
            kontenLengkap TEXT NOT NULL,
            gambarAsset TEXT NOT NULL,
            isFavorite INTEGER NOT NULL DEFAULT 0
          )
        ''');
        await db.execute('''
          CREATE TABLE game_score (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            namaGame TEXT NOT NULL,
            skor INTEGER NOT NULL,
            tanggal TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // ---------- ARTIKEL ----------

  Future<void> seedArtikelIfEmpty(List<Artikel> seedData) async {
    final db = await database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM artikel'),
    );
    if (count == 0) {
      final batch = db.batch();
      for (final artikel in seedData) {
        batch.insert('artikel', artikel.toMap());
      }
      await batch.commit(noResult: true);
    }
  }

  Future<List<Artikel>> getAllArtikel() async {
    final db = await database;
    final maps = await db.query('artikel', orderBy: 'kategori, judul');
    return maps.map((m) => Artikel.fromMap(m)).toList();
  }

  Future<List<Artikel>> getArtikelByKategori(String kategori) async {
    if (kategori == 'Semua') return getAllArtikel();
    final db = await database;
    final maps = await db.query(
      'artikel',
      where: 'kategori = ?',
      whereArgs: [kategori],
      orderBy: 'judul',
    );
    return maps.map((m) => Artikel.fromMap(m)).toList();
  }

  Future<List<Artikel>> searchArtikel(String keyword) async {
    final db = await database;
    final maps = await db.query(
      'artikel',
      where: 'judul LIKE ? OR ringkasan LIKE ?',
      whereArgs: ['%$keyword%', '%$keyword%'],
      orderBy: 'judul',
    );
    return maps.map((m) => Artikel.fromMap(m)).toList();
  }

  Future<List<Artikel>> getFavoriteArtikel() async {
    final db = await database;
    final maps = await db.query('artikel', where: 'isFavorite = 1');
    return maps.map((m) => Artikel.fromMap(m)).toList();
  }

  Future<void> toggleFavorite(int id, bool isFavorite) async {
    final db = await database;
    await db.update(
      'artikel',
      {'isFavorite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ---------- GAME SCORE ----------

  Future<void> insertScore(GameScore score) async {
    final db = await database;
    await db.insert('game_score', score.toMap());
  }

  Future<List<GameScore>> getScoresByGame(String namaGame) async {
    final db = await database;
    final maps = await db.query(
      'game_score',
      where: 'namaGame = ?',
      whereArgs: [namaGame],
      orderBy: 'skor DESC',
      limit: 10,
    );
    return maps.map((m) => GameScore.fromMap(m)).toList();
  }
}
