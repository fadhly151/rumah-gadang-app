import 'package:flutter/material.dart';
import '../data/local_database.dart';
import '../models/artikel.dart';
import '../widgets/content_card.dart';
import 'content_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Artikel> _favorites = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _loading = true);
    final data = await LocalDatabase.instance.getFavoriteArtikel();
    if (!mounted) return;
    setState(() {
      _favorites = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorit Saya')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _favorites.isEmpty
              ? const Center(child: Text('Belum ada konten favorit.'))
              : ListView.builder(
                  itemCount: _favorites.length,
                  itemBuilder: (context, index) {
                    final artikel = _favorites[index];
                    return ContentCard(
                      artikel: artikel,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ContentDetailScreen(artikel: artikel),
                          ),
                        );
                        _loadFavorites();
                      },
                    );
                  },
                ),
    );
  }
}
