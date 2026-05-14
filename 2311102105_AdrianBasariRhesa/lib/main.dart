import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const LmsDashboardScreen(),
    );
  }
}

class LmsDashboardScreen extends StatelessWidget {
  const LmsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy untuk 2 Grid (Tugas Paling Mendesak)
    final List<Map<String, String>> urgentTasks = [
      {
        'tugas': 'Laporan Praktikum 2',
        'matkul': 'Mobile Development (ABP)',
        'deadline': 'Hari ini, 23:59',
        'status': 'Mendesak',
      },
      {
        'tugas': 'Implementasi Model LSTM',
        'matkul': 'Machine Learning',
        'deadline': 'Besok, 12:00',
        'status': 'Mendesak',
      },
    ];

    // Data Dummy untuk 8 List (Tugas Lainnya)
    final List<Map<String, String>> otherTasks = [
      {
        'tugas': 'Review Paper Kriptokurensi',
        'matkul': 'Data Science',
        'deadline': '14 Mei 2026',
        'tipe': 'Individu',
      },
      {
        'tugas': 'Desain ERD Posyandu Remaja',
        'matkul': 'Basis Data',
        'deadline': '15 Mei 2026',
        'tipe': 'Kelompok (Proyek GEMAS)',
      },
      {
        'tugas': 'SRS Web Aduin Dong',
        'matkul': 'Rekayasa Perangkat Lunak',
        'deadline': '16 Mei 2026',
        'tipe': 'Kelompok',
      },
      {
        'tugas': 'Analisis Game Valorant',
        'matkul': 'Game Development',
        'deadline': '17 Mei 2026',
        'tipe': 'Individu',
      },
      {
        'tugas': 'Integrasi Framework Laravel',
        'matkul': 'Pemrograman Web',
        'deadline': '18 Mei 2026',
        'tipe': 'Individu',
      },
      {
        'tugas': 'Tugas Klasifikasi SVM',
        'matkul': 'Machine Learning',
        'deadline': '19 Mei 2026',
        'tipe': 'Individu',
      },
      {
        'tugas': 'Styling Library Bootstrap',
        'matkul': 'Pemrograman Web',
        'deadline': '20 Mei 2026',
        'tipe': 'Individu',
      },
      {
        'tugas': 'Analisis Data Strava',
        'matkul': 'Kecerdasan Buatan',
        'deadline': '21 Mei 2026',
        'tipe': 'Proyek Akhir',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LMS Telkom University',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.red[800],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SECTION 1: GRID VIEW (TUGAS MENDESAK) ---
              const Text(
                'Deadline Terdekat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 grid kanan kiri
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 0.85, // Mengatur rasio tinggi/lebar kotak
                ),
                itemCount: urgentTasks.length,
                itemBuilder: (context, index) {
                  final task = urgentTasks[index];
                  return Card(
                    color: Colors.red[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.red.shade200, width: 1),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              task['status']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            task['tugas']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            task['matkul']!,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  task['deadline']!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // --- SECTION 2: LIST VIEW SEPARATED (TUGAS LAINNYA) ---
              const Text(
                'Daftar Tugas Lainnya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherTasks.length, // Menampilkan 8 list
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final task = otherTasks[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      child: const Icon(Icons.assignment, color: Colors.blue),
                    ),
                    title: Text(
                      task['tugas']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(task['matkul']!),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                task['tipe']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Tenggat',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        Text(
                          task['deadline']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
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
