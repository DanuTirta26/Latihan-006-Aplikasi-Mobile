import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiProfilDanu());
}

class AplikasiProfilDanu extends StatelessWidget {
  const AplikasiProfilDanu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Aplikasi Profil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HalamanProfilUtama(),
    );
  }
}

// REFACTOR: Ubah ke StatefulWidget sesuai modul Hari 4
class HalamanProfilUtama extends StatefulWidget {
  const HalamanProfilUtama({super.key});

  @override
  State<HalamanProfilUtama> createState() => _HalamanProfilUtamaState();
}

class _HalamanProfilUtamaState extends State<HalamanProfilUtama> {
  // Variabel namaDosen dibuat tidak final agar bisa diubah melalui setState
  String namaDosen = 'I Ketut Gunawan, S.Kom, M.T.I.';
  final String profesi = 'Senior Backend Engineer & Dosen';
  final List<String> riwayatKerja = [
    'Senior Backend Engineer - EDC Bank DKI',
    'Backend & System Architect - Secure Payment EDC',
    'Lead Developer - Aplikasi Sekurindo',
    'Backend Engineer - Pengembangan Sistem E-money',
  ];

  // FUNGSI BARU: Memunculkan form dialog edit
  void _tampilkanDialogEdit() {
    TextEditingController namaController = TextEditingController(text: namaDosen);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Nama Profil'),
          content: TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'Nama Baru',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update state saat tombol simpan ditekan
                setState(() {
                  namaDosen = namaController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Nama berhasil diperbarui!')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AvatarProfil(),
            const SizedBox(height: 16),
            // InfoProfil sekarang akan ter-update otomatis kalau namaDosen berubah
            InfoProfil(nama: namaDosen, role: profesi),
            const SizedBox(height: 24),
            
            ElevatedButton.icon(
              // Panggil fungsi dialog di sini
              onPressed: _tampilkanDialogEdit,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),
            const SizedBox(height: 24),
            
            const WidgetStatistik(),
            const SizedBox(height: 24),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman Kerja',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            
            Expanded(
              child: ListView.builder(
                itemCount: riwayatKerja.length,
                itemBuilder: (context, index) {
                  return KartuPengalaman(pengalaman: riwayatKerja[index]);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// REUSABLE COMPONENTS (EXTRACT WIDGETS) - SAMA PERSIS SEPERTI SEBELUMNYA
// ==========================================

class AvatarProfil extends StatelessWidget {
  const AvatarProfil({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

class InfoProfil extends StatelessWidget {
  final String nama;
  final String role;
  const InfoProfil({super.key, required this.nama, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nama,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          role,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class WidgetStatistik extends StatelessWidget {
  const WidgetStatistik({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemStatistik(count: '15', label: 'Proyek'),
          SizedBox(width: 24),
          ItemStatistik(count: '1.2K', label: 'Followers'),
          SizedBox(width: 24),
          ItemStatistik(count: '42', label: 'Following'),
        ],
      ),
    );
  }
}

class ItemStatistik extends StatelessWidget {
  final String count;
  final String label;
  const ItemStatistik({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}

class KartuPengalaman extends StatelessWidget {
  final String pengalaman;
  const KartuPengalaman({super.key, required this.pengalaman});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.teal),
        title: Text(pengalaman),
      ),
    );
  }
}