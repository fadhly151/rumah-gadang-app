import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/sample_arsip.dart';
import '../models/arsip_item.dart';
import '../utils/theme.dart';

/// Modul "Arsip Leiden": katalog terkurasi foto lama Minangkabau dari
/// koleksi KITLV / Leiden University Libraries yang berstatus Public Domain,
/// serta tautan portal resmi untuk penelusuran manuskrip lebih lanjut.
///
/// Desain sengaja "link-out" (membuka browser) alih-alih menyalin gambar ke
/// dalam aplikasi, supaya selalu mengarah ke sumber asli, atribusi tetap
/// jelas, dan tidak melanggar ketentuan penggunaan Leiden.
class ArsipScreen extends StatelessWidget {
  const ArsipScreen({super.key});

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak bisa membuka tautan: $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final arsipList = sampleArsipList();
    final portalLinks = arsipPortalLinks();

    return Scaffold(
      appBar: AppBar(title: const Text('Arsip Leiden')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Foto & manuskrip di bawah berasal dari koleksi Leiden '
              'University Libraries (KITLV), Belanda. Ketuk sebuah kartu '
              'untuk membuka & melihat/mengunduh langsung dari sumber '
              'aslinya di browser.',
              style: TextStyle(fontSize: 13),
            ),
          ),
          Text(
            'Foto Bebas Unduh (Public Domain)',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...arsipList.map((item) => _ArsipCard(item: item, onTap: () => _openUrl(context, item.urlSumber))),
          const SizedBox(height: 20),
          Text(
            'Jelajahi Lebih Banyak',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...portalLinks.map((link) => Card(
                child: ListTile(
                  leading: const Icon(Icons.public, color: AppColors.maroon),
                  title: Text(link.judul, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(link.deskripsi),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => _openUrl(context, link.url),
                ),
              )),
        ],
      ),
    );
  }
}

class _ArsipCard extends StatelessWidget {
  final ArsipItem item;
  final VoidCallback onTap;

  const _ArsipCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.judul,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.lisensi,
                      style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(item.deskripsi, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(item.tahun, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  const SizedBox(width: 16),
                  Icon(Icons.folder_open, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(item.koleksi, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  const Spacer(),
                  const Icon(Icons.open_in_new, size: 16, color: AppColors.maroon),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
