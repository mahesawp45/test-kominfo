import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPengaduanPage extends StatelessWidget {
  final Map<String, dynamic>? complaint;

  const DetailPengaduanPage({super.key, this.complaint});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Selesai':
        return Colors.green;
      case 'Dalam Proses':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildFilePreview(String? fileUrl) {
    if (fileUrl == null || fileUrl.isEmpty) return const SizedBox.shrink();

    final isImage = fileUrl.toLowerCase().endsWith('.jpg') ||
        fileUrl.toLowerCase().endsWith('.png') ||
        fileUrl.toLowerCase().endsWith('.jpeg');

    return GestureDetector(
      onTap: () => _launchUrl(fileUrl),
      child: Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isImage
            ? Image.network(fileUrl, fit: BoxFit.cover)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.insert_drive_file,
                    size: 40,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    fileUrl.split('/').last,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (complaint == null) {
      return const Scaffold(
        body: Center(child: Text('Data pengaduan tidak ditemukan')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengaduan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    complaint?['title'] ?? 'Tanpa Judul',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(complaint?['status'] ?? '')
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    complaint?['status'] ?? 'Status Tidak Diketahui',
                    style: TextStyle(
                      color: _getStatusColor(complaint?['status'] ?? ''),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Tanggal Pengaduan: ${complaint?['date'] ?? 'Tanggal Tidak Diketahui'}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Deskripsi Masalah:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              complaint?['description'] ?? 'Tidak ada deskripsi',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            if (complaint?['fileUrl'] != null &&
                complaint?['fileUrl'].isNotEmpty)
              const Text(
                'Bukti Lampiran:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            _buildFilePreview(complaint?['fileUrl']),
          ],
        ),
      ),
    );
  }
}
