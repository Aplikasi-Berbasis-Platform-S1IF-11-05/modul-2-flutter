import 'package:flutter/material.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS Kampus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Arial',
      ),
      home: const LMSHomePage(),
    );
  }
}

class LMSHomePage extends StatelessWidget {
  const LMSHomePage({super.key});

  final List<Map<String, String>> urgentTasks = const [
    {
      'nama': 'Quiz Mobile Flutter',
      'matkul': 'Pemrograman Mobile',
      'deadline': 'Hari ini, 23:59',
      'status': 'Sangat dekat',
    },
    {
      'nama': 'Laporan Database',
      'matkul': 'Basis Data',
      'deadline': 'Besok, 18:00',
      'status': 'Prioritas',
    },
  ];

  final List<Map<String, String>> otherTasks = const [
    {
      'nama': 'Resume Materi UI/UX',
      'matkul': 'Desain Interaksi',
      'deadline': '14 Mei 2026',
      'tipe': 'Individu',
      'status': 'Belum dikerjakan',
    },
    {
      'nama': 'Tugas Algoritma Sorting',
      'matkul': 'Struktur Data',
      'deadline': '15 Mei 2026',
      'tipe': 'Individu',
      'status': 'Proses',
    },
    {
      'nama': 'Laporan Final',
      'matkul': 'Informatika Untuk Masyarakat',
      'deadline': '17 Mei 2026',
      'tipe': 'Individu',
      'status': 'Belum dikerjakan',
    },
    {
      'nama': 'Desain Wireframe Aplikasi',
      'matkul': 'ABP',
      'deadline': '18 Mei 2026',
      'tipe': 'Individu',
      'status': 'Proses',
    },
    {
      'nama': 'Presentasi Progres',
      'matkul': 'Computing Project',
      'deadline': '19 Mei 2026',
      'tipe': 'Kelompok',
      'status': 'Belum dikerjakan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      appBar: AppBar(
        title: const Text('LMS Kampus'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tugas Deadline Terdekat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: urgentTasks.map((task) {
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        task['nama']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        task['matkul']!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        task['deadline']!,
                        style: const TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            const Text(
              'Daftar Tugas Lainnya',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ListView.separated(
              itemCount: otherTasks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                final task = otherTasks[index];

                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task['nama']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              task['matkul']!,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Deadline: ${task['deadline']}'),
                            Text('Tipe: ${task['tipe']}'),
                            Text('Status: ${task['status']}'),
                          ],
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
    );
  }
}