import 'package:flutter/material.dart';
import '../data/local_database.dart';
import '../models/artikel.dart';
import '../utils/theme.dart';

class ContentDetailScreen extends StatefulWidget {
  final Artikel artikel;
  const ContentDetailScreen({super.key, required this.artikel});

  @override
  State<ContentDetailScreen> createState() => _ContentDetailScreenState();
}

class _ContentDetailScreenState extends State<ContentDetailScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.artikel.isFavorite;
  }

  Future<void> _toggleFavorite() async {
    if (widget.artikel.id == null) return;
    setState(() => _isFavorite = !_isFavorite);
    await LocalDatabase.instance.toggleFavorite(widget.artikel.id!, _isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final artikel = widget.artikel;
    return Scaffold(
      appBar: AppBar(
        title: Text(artikel.judul),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              artikel.gambarAsset,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: double.infinity,
                height: 220,
                color: AppColors.gold.withOpacity(0.3),
                child: const Icon(Icons.image_not_supported_outlined, size: 48),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(artikel.kategori),
                    backgroundColor: AppColors.gold.withOpacity(0.3),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    artikel.kontenLengkap,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
