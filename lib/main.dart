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

class HalamanProfilUtama extends StatelessWidget {
  const HalamanProfilUtama({super.key});

  final String namaDosen = 'I Ketut Gunawan, S.Kom, M.T.I.';
  final String profesi = 'Senior Backend Engineer & Dosen';

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
            InfoProfil(nama: namaDosen, role: profesi), 
            const SizedBox(height: 24),
            
            const WidgetStatistik(), // HARI 2 SIANG: Udah dipanggil jadi Custom Widget
          ],
        ),
      ),
    );
  }
}

class AvatarProfil extends StatelessWidget {
  const AvatarProfil({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(radius: 50, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 50, color: Colors.white));
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
        Text(nama, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text(role, style: TextStyle(fontSize: 16, color: Colors.grey[700]), textAlign: TextAlign.center),
      ],
    );
  }
}

// ==========================================
// REUSABLE COMPONENTS BARU (HARI 2)
// ==========================================

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
        Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}