import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/urgent_task_card.dart';
import '../widgets/task_list_tile.dart';

/// Halaman utama yang menampilkan ringkasan tugas.
///
/// Layar ini menyajikan daftar tugas mendesak dalam format grid
/// dan daftar tugas lainnya menggunakan list view.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Data

  final List<TaskModel> urgentTasks = [
    const TaskModel(title: 'Tugas 4: Laporan Progres', course: 'INFORMATIKA MASYARAKAT', deadline: '10 Mei 2026', time: '15:00 WIB'),
    const TaskModel(title: 'Tugas 10.2b - API', course: 'APLIKASI PLATFORM', deadline: '11 Mei 2026', time: '23:59 WIB'),
  ];

  final List<TaskModel> otherTasks = [
    const TaskModel(title: 'Quiz 2', course: 'PEMROGRAMAN BERGERAK', deadline: '15 Mei 2026', time: '10:00 WIB'),
    const TaskModel(title: 'Review Jurnal AI', course: 'KECERDASAN BUATAN', deadline: '16 Mei 2026', time: '23:59 WIB'),
    const TaskModel(title: 'Final Project Draft', course: 'DESAIN UI/UX', deadline: '18 Mei 2026', time: '23:59 WIB'),
    const TaskModel(title: 'Tugas Praktikum 3', course: 'PEMROGRAMAN BERGERAK', deadline: '20 Mei 2026', time: '08:00 WIB'),
    const TaskModel(title: 'Latihan Soal UTS', course: 'MATEMATIKA DISKRIT', deadline: '22 Mei 2026', time: '13:00 WIB'),
    const TaskModel(title: 'Paper Metodologi', course: 'METODOLOGI PENELITIAN', deadline: '24 Mei 2026', time: '16:00 WIB'),
    const TaskModel(title: 'Presentasi Bisnis', course: 'TECHNOPRENEURSHIP', deadline: '26 Mei 2026', time: '09:00 WIB'),
    const TaskModel(title: 'Laporan Keamanan Jaringan', course: 'KEAMANAN SIBER', deadline: '28 Mei 2026', time: '23:59 WIB'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text(
          'LMS Dashboard', 
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xFF37352F))
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFE9E9E7),
            height: 1.0,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Mendekati Deadline', '2 Tugas'),
              const SizedBox(height: 12),
              _buildUrgentTasksGrid(),
              
              const SizedBox(height: 32),
              
              _buildSectionTitle('Daftar Tugas Lainnya', '${otherTasks.length} Tugas'),
              const SizedBox(height: 12),
              _buildOtherTasksList(),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets

  /// Membangun judul bagian dengan teks tambahan di samping.
  ///
  /// Digunakan untuk memberikan konteks visual pada setiap
  /// kategori tugas yang ditampilkan di dashboard.
  Widget _buildSectionTitle(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF37352F)),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF787774)),
        ),
      ],
    );
  }

  /// Menampilkan grid tugas yang mendekati batas waktu.
  ///
  /// Mengatur tata letak kartu tugas mendesak agar 
  /// mudah dilihat oleh pengguna saat pertama kali membuka aplikasi.
  Widget _buildUrgentTasksGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: urgentTasks.length,
      itemBuilder: (context, index) {
        return UrgentTaskCard(task: urgentTasks[index]);
      },
    );
  }

  /// Menampilkan daftar linear untuk tugas lainnya.
  ///
  /// Menyusun daftar tugas tambahan dalam format list
  /// yang dapat discroll untuk efisiensi ruang layar.
  Widget _buildOtherTasksList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: otherTasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return TaskListTile(task: otherTasks[index]);
      },
    );
  }
}