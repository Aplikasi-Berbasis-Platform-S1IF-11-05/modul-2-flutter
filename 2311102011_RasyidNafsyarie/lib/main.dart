//Rasyid Nafsyarie
//2311102011
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  final String title;
  final String course;
  final String deadline;
  final String additionalData;

  const Task(this.title, this.course, this.deadline, this.additionalData);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Kampus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
      ),
      home: const LMSDashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LMSDashboardScreen extends StatelessWidget {
  const LMSDashboardScreen({super.key});

  // Data 2 Tugas Terdekat (Grid)
  final List<Task> urgentTasks = const [
    Task('Praktikum Modul 2', 'Aplikasi Berbasis Platform', 'Hari ini, 23:59', 'Belum disubmit'),
    Task('Makalah Kelompok', 'Rekayasa Perangkat Lunak', 'Besok, 12:00', 'Draft'),
  ];

  // Data 8 Tugas Lainnya (List)
  final List<Task> otherTasks = const [
    Task('Tugas Pendahuluan', 'Jaringan Komputer', '13 Mei 2026', 'Pertemuan 5'),
    Task('Quiz 1', 'Basis Data', '14 Mei 2026', 'Materi: Normalisasi'),
    Task('Presentasi Project', 'Kecerdasan Buatan', '15 Mei 2026', 'Durasi: 15 Menit'),
    Task('Laporan Akhir', 'Metodologi Penelitian', '16 Mei 2026', 'Format PDF'),
    Task('Review Jurnal', 'Keamanan Jaringan', '17 Mei 2026', 'Minimal 3 Jurnal'),
    Task('Tugas Besar', 'Pengembangan Web', '18 Mei 2026', 'Gunakan Framework Laravel'),
    Task('Latihan Soal', 'Matematika Diskrit', '19 Mei 2026', 'Bab Graf'),
    Task('Design Prototype', 'Interaksi Manusia Komputer', '20 Mei 2026', 'Link Figma'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('LMS Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.indigo),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Deadline Terdekat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // GridView untuk 2 tugas terdekat
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: urgentTasks.length,
                itemBuilder: (context, index) {
                  final task = urgentTasks[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          width: double.infinity,
                          child: const Row(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Text('Segera', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                task.course,
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.access_time, size: 14, color: Colors.red),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      task.deadline,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Daftar Tugas Lainnya',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // ListView untuk 8 tugas lainnya
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherTasks.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final task = otherTasks[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.assignment, color: Colors.indigo),
                      ),
                      title: Text(
                        task.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            task.course,
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.info_outline, size: 14, color: Colors.grey.shade500),
                              const SizedBox(width: 4),
                              Text(
                                task.additionalData,
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
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
                            'Deadline',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            task.deadline,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 12,
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