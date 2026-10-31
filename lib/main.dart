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
            const AvatarProfil(), // UI sudah di-extract
            const SizedBox(height: 16),
            InfoProfil(nama: namaDosen, role: profesi), // UI sudah di-extract
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