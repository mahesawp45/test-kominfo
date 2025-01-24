import 'package:flutter/material.dart';
import 'package:test_kominfo/pages/detail_pengaduan.dart';
import 'package:test_kominfo/pages/form_pengaduan_page.dart';
import 'package:test_kominfo/widgets/dialog/login_dialog.dart';
import 'package:test_kominfo/widgets/navigation/primary_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Dummy data for demonstration
  final List<Map<String, dynamic>> complaints = const [
    {
      'title': 'Jalan Rusak',
      'status': 'Dalam Proses',
      'date': '15 Maret 2024',
      'description':
          'Jalan utama di Desa Makmur mengalami kerusakan parah dengan banyak lubang yang membahayakan pengendara',
      'fileUrl': 'https://example.com/images/jalan_rusak.jpg',
    },
    {
      'title': 'Lampu Jalan Mati',
      'status': 'Selesai',
      'date': '14 Maret 2024',
      'description':
          'Lampu jalan di RT 05/RW 02 tidak menyala selama 1 minggu terakhir',
      'fileUrl': 'https://example.com/docs/laporan_lampu.pdf',
    },
    {
      'title': 'Sampah Menumpuk',
      'status': 'Belum Diproses',
      'date': '13 Maret 2024',
      'description':
          'Tumpukan sampah di depan Pasar Indah sudah tidak diangkut selama 5 hari',
      'fileUrl': 'https://example.com/images/sampah_menumpuk.jpg',
    },
    {
      'title': 'Banjir Parah',
      'status': 'Dalam Proses',
      'date': '12 Maret 2024',
      'description':
          'Genangan air setinggi 50cm di permukiman warga akibat drainase yang tersumbat',
      'fileUrl': 'https://example.com/docs/laporan_banjir.docx',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PrimaryNavigation.pushFromBottom(
            context,
            page: const FormPengaduanPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Daftar Pengaduan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.separated(
          itemCount: complaints.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final complaint = complaints[index];
            return ItemPengaduan(
              title: complaint['title']!,
              status: complaint['status']!,
              date: complaint['date']!,
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => LoginDialog(
                    onTap: () {
                      PrimaryNavigation.pushFromRight(
                        context,
                        page: DetailPengaduanPage(
                          complaint: complaint,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemPengaduan extends StatelessWidget {
  final String title;
  final String status;
  final String date;

  final void Function() onTap;

  const ItemPengaduan({
    super.key,
    required this.title,
    required this.status,
    required this.date,
    required this.onTap,
  });

  Color _getStatusColor() {
    switch (status) {
      case 'Selesai':
        return Colors.green;
      case 'Dalam Proses':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: _getStatusColor(),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
