// Syiva Qaila Natasa Sugama - 2311102106 - IF-11-05
// Tugas 2 Mobile Flutter - LMS Task Dashboard
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
      title: 'Task 2 Mobile Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E4D91)),
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        useMaterial3: true,
      ),
      home: const TaskDashboardPage(),
    );
  }
}

class TaskDashboardPage extends StatelessWidget {
  const TaskDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nearestTasks = <TaskItem>[
      const TaskItem(
        title: 'UI Prototype LMS',
        course: 'Pemrograman Mobile',
        deadline: '12 Mei 2026, 18:00',
        status: 'Paling dekat',
        accentColor: Color(0xFFFF8A65),
        icon: Icons.phone_android,
      ),
      const TaskItem(
        title: 'Analisis Use Case',
        course: 'Rekayasa Perangkat Lunak',
        deadline: '14 Mei 2026, 09:00',
        status: 'Deadline segera',
        accentColor: Color(0xFF4FC3F7),
        icon: Icons.assignment,
      ),
    ];

    final otherTasks = <TaskItem>[
      const TaskItem(
        title: 'Query Database Mahasiswa',
        course: 'Basis Data',
        deadline: '16 Mei 2026, 23:59',
        status: '8 tugas tersisa',
        accentColor: Color(0xFF9575CD),
        icon: Icons.storage,
      ),
      const TaskItem(
        title: 'Presentasi Proyek',
        course: 'Manajemen Proyek',
        deadline: '17 Mei 2026, 10:30',
        status: 'Slide final',
        accentColor: Color(0xFF4DB6AC),
        icon: Icons.slideshow,
      ),
      const TaskItem(
        title: 'Review Kode API',
        course: 'Pemrograman Web',
        deadline: '18 Mei 2026, 20:00',
        status: 'Perlu screenshot hasil',
        accentColor: Color(0xFF7986CB),
        icon: Icons.code,
      ),
      const TaskItem(
        title: 'Laporan Pengujian',
        course: 'Software Testing',
        deadline: '19 Mei 2026, 12:00',
        status: 'Format PDF',
        accentColor: Color(0xFFFFB74D),
        icon: Icons.fact_check,
      ),
      const TaskItem(
        title: 'Mockup Figma',
        course: 'Desain Antarmuka',
        deadline: '20 Mei 2026, 15:00',
        status: 'Harus responsif',
        accentColor: Color(0xFF64B5F6),
        icon: Icons.design_services,
      ),
      const TaskItem(
        title: 'Dataset Cleaning',
        course: 'Data Mining',
        deadline: '21 Mei 2026, 17:30',
        status: 'Gunakan CSV final',
        accentColor: Color(0xFF81C784),
        icon: Icons.dataset,
      ),
      const TaskItem(
        title: 'Implementasi Notifikasi',
        course: 'Mobile Development',
        deadline: '22 Mei 2026, 21:00',
        status: 'Fokus pada FCM',
        accentColor: Color(0xFFE57373),
        icon: Icons.notifications_active,
      ),
      const TaskItem(
        title: 'Refleksi Praktikum',
        course: 'Etika Profesi',
        deadline: '24 Mei 2026, 08:00',
        status: 'Tulisan 2 halaman',
        accentColor: Color(0xFFBA68C8),
        icon: Icons.notes,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'LMS Task Dashboard',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.school_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HeaderCard(),
            const SizedBox(height: 20),
            const Text(
              'Tugas paling dekat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: nearestTasks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.92,
              ),
              itemBuilder: (context, index) {
                return _DeadlineGridCard(task: nearestTasks[index]);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Daftar tugas lainnya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherTasks.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _TaskListTile(task: otherTasks[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem {
  const TaskItem({
    required this.title,
    required this.course,
    required this.deadline,
    required this.status,
    required this.accentColor,
    required this.icon,
  });

  final String title;
  final String course;
  final String deadline;
  final String status;
  final Color accentColor;
  final IconData icon;
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF163A63), Color(0xFF2D6AA6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard LMS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ringkasan tugas kuliah yang paling mendekati deadline dan daftar tugas lainnya.',
            style: TextStyle(color: Color(0xFFE8EEF7), height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _DeadlineGridCard extends StatelessWidget {
  const _DeadlineGridCard({required this.task});

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: task.accentColor.withValues(alpha: 0.18)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: task.accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(task.icon, color: task.accentColor),
          ),
          const SizedBox(height: 14),
          Text(
            task.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            task.course,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          _DeadlineBadge(text: task.deadline, color: task.accentColor),
          const SizedBox(height: 10),
          Text(
            task.status,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _TaskListTile extends StatelessWidget {
  const _TaskListTile({required this.task});

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: task.accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(task.icon, color: task.accentColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.course,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    _MiniInfoChip(icon: Icons.schedule, text: task.deadline),
                    _MiniInfoChip(icon: Icons.info_outline, text: task.status),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DeadlineBadge extends StatelessWidget {
  const _DeadlineBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _MiniInfoChip extends StatelessWidget {
  const _MiniInfoChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FB),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF3A4A61)),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
