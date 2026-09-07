import 'package:flutter/material.dart';
import '../data/local_database.dart';
import '../models/artikel.dart';
import '../utils/constants.dart';
import '../widgets/content_card.dart';
import '../widgets/category_chip.dart';
import 'content_detail_screen.dart';

class ContentListScreen extends StatefulWidget {
  const ContentListScreen({super.key});

  @override
  State<ContentListScreen> createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  String _selectedKategori = 'Semua';
  String _keyword = '';
  List<Artikel> _artikelList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    final data = _keyword.isNotEmpty
        ? await LocalDatabase.instance.searchArtikel(_keyword)
        : await LocalDatabase.instance.getArtikelByKategori(_selectedKategori);
    if (!mounted) return;
    setState(() {
      _artikelList = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ensiklopedia Rumah Gadang')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari topik, misal: gonjong, ukiran...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (value) {
                _keyword = value;
                _loadData();
              },
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: AppConstants.kategoriList.map((kategori) {
                return CategoryChip(
                  label: kategori,
                  selected: _selectedKategori == kategori && _keyword.isEmpty,
                  onTap: () {
                    _selectedKategori = kategori;
                    _keyword = '';
                    _loadData();
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _artikelList.isEmpty
                    ? const Center(child: Text('Belum ada konten untuk filter ini.'))
                    : ListView.builder(
                        itemCount: _artikelList.length,
                        itemBuilder: (context, index) {
                          final artikel = _artikelList[index];
                          return ContentCard(
                            artikel: artikel,
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ContentDetailScreen(artikel: artikel),
                                ),
                              );
                              _loadData(); // refresh status favorit setelah kembali
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
