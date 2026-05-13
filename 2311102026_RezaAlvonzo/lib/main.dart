// 2311102026 - Reza Alvonzo - IF-11-05 - Praktikum Modul 2 Mobile Flutter
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE2231A),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F3F1),
        useMaterial3: true,
      ),
      home: const LmsDashboardPage(),
    );
  }
}

class LmsDashboardPage extends StatelessWidget {
  const LmsDashboardPage({super.key});

  static const List<TaskItem> _highlightTasks = <TaskItem>[
    TaskItem(
      course: 'Basis Data',
      title: 'Upload ERD Final',
      deadline: '13 Mei 2026',
      status: 'Paling Dekat',
      color: Color(0xFFE2231A),
      icon: Icons.layers_outlined,
      additionalInfo: 'Bobot 20% · 1 file PDF',
    ),
    TaskItem(
      course: 'Pemrograman Mobile',
      title: 'Submit Task 2 Flutter',
      deadline: '14 Mei 2026',
      status: 'Paling Dekat',
      color: Color(0xFF8B1E13),
      icon: Icons.phone_android_outlined,
      additionalInfo: 'Kumpulkan via LMS · 1 repo',
    ),
  ];

  static const List<TaskItem> _otherTasks = <TaskItem>[
    TaskItem(
      course: 'Jaringan Komputer',
      title: 'Laporan Praktikum Topologi',
      deadline: '16 Mei 2026',
      status: 'Menunggu Review',
      color: Color(0xFFB3261E),
      icon: Icons.wifi_tethering_outlined,
      additionalInfo: 'Format DOCX · 8 halaman',
    ),
    TaskItem(
      course: 'Rekayasa Perangkat Lunak',
      title: 'User Story dan Use Case',
      deadline: '17 Mei 2026',
      status: 'Dokumen',
      color: Color(0xFF5D1A12),
      icon: Icons.assignment_outlined,
      additionalInfo: 'Kelompok 4 orang · Sprint 2',
    ),
    TaskItem(
      course: 'Statistika',
      title: 'Analisis Data UTS',
      deadline: '18 Mei 2026',
      status: 'Presentasi',
      color: Color(0xFFE84D3C),
      icon: Icons.bar_chart_outlined,
      additionalInfo: 'Lampirkan grafik dan kesimpulan',
    ),
    TaskItem(
      course: 'Pemrograman Web',
      title: 'Landing Page Kampus',
      deadline: '19 Mei 2026',
      status: 'Frontend',
      color: Color(0xFF8B1E13),
      icon: Icons.web_outlined,
      additionalInfo: 'Responsive mobile-first',
    ),
    TaskItem(
      course: 'Basis Data',
      title: 'Normalisasi Tabel',
      deadline: '20 Mei 2026',
      status: 'SQL',
      color: Color(0xFFB3261E),
      icon: Icons.storage_outlined,
      additionalInfo: '1NF sampai 3NF',
    ),
    TaskItem(
      course: 'Kewirausahaan',
      title: 'PPT Ide Bisnis Digital',
      deadline: '21 Mei 2026',
      status: 'Pitch Deck',
      color: Color(0xFF5D1A12),
      icon: Icons.campaign_outlined,
      additionalInfo: 'Maksimal 10 slide',
    ),
    TaskItem(
      course: 'Interaksi Manusia Komputer',
      title: 'Wireframe Aplikasi',
      deadline: '22 Mei 2026',
      status: 'Prototype',
      color: Color(0xFFE2231A),
      icon: Icons.design_services_outlined,
      additionalInfo: 'Gambar low fidelity',
    ),
    TaskItem(
      course: 'Etika Profesi',
      title: 'Ringkasan Studi Kasus',
      deadline: '23 Mei 2026',
      status: 'Esai',
      color: Color(0xFF8B1E13),
      icon: Icons.article_outlined,
      additionalInfo: 'Minimal 500 kata',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFFFFECE8),
              Color(0xFFF7F3F1),
              Color(0xFFFDFDFC),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeader(context),
                const SizedBox(height: 20),
                _buildSectionTitle(
                  context,
                  title: 'Deadline Terdekat',
                  subtitle: '2 tugas yang paling mendekati tenggat',
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  itemCount: _highlightTasks.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _UrgentTaskCard(task: _highlightTasks[index]);
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionTitle(
                  context,
                  title: 'Daftar Tugas Lainnya',
                  subtitle: '8 tugas di luar grid utama',
                ),
                const SizedBox(height: 12),
                ListView.separated(
                  itemCount: _otherTasks.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (BuildContext context, int index) {
                    return _TaskListTile(task: _otherTasks[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xFFE2231A), Color(0xFF8B1E13)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x33E2231A),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.24),
                    ),
                  ),
                  child: const Icon(
                    Icons.school_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'LMS Telkom Style',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pantau tugas kuliah dengan tampilan cepat dan fokus.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: <Widget>[
                _HeaderStatChip(
                  label: 'Mata Kuliah',
                  value: '8',
                  icon: Icons.menu_book_outlined,
                ),
                const SizedBox(width: 10),
                _HeaderStatChip(
                  label: 'Deadline Dekat',
                  value: '2',
                  icon: Icons.schedule_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1C1B1F),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF6D6A70)),
        ),
      ],
    );
  }
}

class TaskItem {
  const TaskItem({
    required this.course,
    required this.title,
    required this.deadline,
    required this.status,
    required this.color,
    required this.icon,
    required this.additionalInfo,
  });

  final String course;
  final String title;
  final String deadline;
  final String status;
  final Color color;
  final IconData icon;
  final String additionalInfo;
}

class _HeaderStatChip extends StatelessWidget {
  const _HeaderStatChip({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UrgentTaskCard extends StatelessWidget {
  const _UrgentTaskCard({required this.task});

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: task.color.withValues(alpha: 0.14)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: task.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(task.icon, color: task.color, size: 22),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFFDECEC),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              task.status,
              style: TextStyle(
                color: task.color,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            task.course,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF6D6A70),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF1C1B1F),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Deadline ${task.deadline}',
            style: TextStyle(
              color: task.color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            task.additionalInfo,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF6D6A70),
              fontSize: 10,
              height: 1.2,
            ),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE9E2DD)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: task.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(task.icon, color: task.color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          task.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF1C1B1F),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0EE),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          task.status,
                          style: TextStyle(
                            color: task.color,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.course,
                    style: const TextStyle(
                      color: Color(0xFF6D6A70),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Icon(Icons.event_outlined, size: 16, color: task.color),
                      const SizedBox(width: 6),
                      Text(
                        task.deadline,
                        style: TextStyle(
                          color: task.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    task.additionalInfo,
                    style: const TextStyle(
                      color: Color(0xFF6D6A70),
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
