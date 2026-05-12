import 'package:flutter/material.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard LMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const DashboardLMS(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Model data untuk Tugas
class Tugas {
  final String namaTugas;
  final String mataKuliah;
  final String deadline;
  final String status;
  final Color warnaStatus;

  Tugas({
    required this.namaTugas,
    required this.mataKuliah,
    required this.deadline,
    required this.status,
    required this.warnaStatus,
  });
}

class DashboardLMS extends StatefulWidget {
  const DashboardLMS({super.key});

  @override
  State<DashboardLMS> createState() => _DashboardLMSState();
}

class _DashboardLMSState extends State<DashboardLMS> {
  // Data 2 Tugas dengan deadline terdekat untuk GridView
  final List<Tugas> tugasMendesak = [
    Tugas(
      namaTugas: 'Task 2 Mobile Flutter',
      mataKuliah: 'Aplikasi Berbasis Platform',
      deadline: 'Besok, 23:59',
      status: 'Belum Dikumpulkan',
      warnaStatus: Colors.redAccent,
    ),
    Tugas(
      namaTugas: 'Quiz ABP',
      mataKuliah: 'Aplikasi Berbasis Platform',
      deadline: '2 Hari Lagi',
      status: 'Belum Dikumpulkan',
      warnaStatus: Colors.redAccent,
    ),
  ];

  // Data 8 Tugas lainnya untuk ListView
  final List<Tugas> tugasLainnya = [
    Tugas(
      namaTugas: 'Progress 1',
      mataKuliah: 'Pemrograman Web (Laravel)',
      deadline: '15 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
    Tugas(
      namaTugas: 'Data Cleaning Dataset',
      mataKuliah: 'Big Data (PySpark)',
      deadline: '16 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
    Tugas(
      namaTugas: 'Setup EC2 & S3',
      mataKuliah: 'Cloud Computing (AWS)',
      deadline: '18 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
    Tugas(
      namaTugas: 'Latihan Soal',
      mataKuliah: 'Kecerdasan Buatan',
      deadline: '20 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
    Tugas(
      namaTugas: 'Desain UI/UX Mockup',
      mataKuliah: 'Interaksi Manusia Komputer',
      deadline: '22 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
    Tugas(
      namaTugas: 'Laporan Praktikum',
      mataKuliah: 'Jaringan Komputer',
      deadline: '27 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
    Tugas(
      namaTugas: 'Implementasi AJAX',
      mataKuliah: 'Pemrograman Web Lanjut',
      deadline: '30 Mei 2026',
      status: 'Selesai',
      warnaStatus: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard LMS'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SECTION 1: GRID VIEW ---
              const Text(
                'Deadline Terdekat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true, // Agar GridView menyesuaikan tinggi konten
                physics: const NeverScrollableScrollPhysics(), // Mematikan scroll internal grid agar scroll mengikuti SingleChildScrollView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 grid kanan kiri
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85, // Rasio ukuran kotak grid
                ),
                itemCount: tugasMendesak.length, // Berisi 2 tugas
                itemBuilder: (context, index) {
                  final tugas = tugasMendesak[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: tugas.warnaStatus.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  tugas.deadline,
                                  style: TextStyle(
                                    color: tugas.warnaStatus,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                tugas.namaTugas,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Text(
                            tugas.mataKuliah,
                            style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 24),

              // --- SECTION 2: LIST VIEW ---
              const Text(
                'Daftar Tugas Lainnya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true, // Agar ListView menyesuaikan tinggi konten
                physics: const NeverScrollableScrollPhysics(), // Mematikan scroll internal list
                itemCount: tugasLainnya.length, // Berisi 8 tugas
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final tugas = tugasLainnya[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      title: Text(
                        tugas.namaTugas,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tugas.mataKuliah),
                            const SizedBox(height: 4),
                            Text(
                              'Deadline: ${tugas.deadline}',
                              style: const TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            tugas.status == 'Selesai' 
                                ? Icons.check_circle 
                                : Icons.pending_actions,
                            color: tugas.warnaStatus,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tugas.status,
                            style: TextStyle(
                              fontSize: 10,
                              color: tugas.warnaStatus,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}