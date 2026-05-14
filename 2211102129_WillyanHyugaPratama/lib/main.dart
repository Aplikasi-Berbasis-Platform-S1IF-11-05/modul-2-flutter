// Willyan Hyuga Pratama
// 2211102129
// IF-11-05
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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF102033),
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF102033),
          ),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF5B6574)),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 900 ? 40.0 : 16.0;
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                20,
                horizontalPadding,
                24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _HeaderSection(),
                  const SizedBox(height: 20),
                  const _SectionTitle(
                    title: 'Tugas Paling Dekat',
                    subtitle: 'Dua tugas dengan deadline terdekat',
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _upcomingTasks.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.74,
                        ),
                    itemBuilder: (context, index) {
                      return _UpcomingTaskCard(task: _upcomingTasks[index]);
                    },
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle(
                    title: 'Daftar Tugas Lain',
                    subtitle: '8 tugas tambahan di luar dua grid utama',
                  ),
                  const SizedBox(height: 12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _otherTasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _TaskListItem(task: _otherTasks[index]);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F766E), Color(0xFF155E75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F0F766E),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LMS Dashboard',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Pantau tugas yang paling dekat deadline-nya dalam satu layar.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              _StatChip(label: 'Tugas dekat', value: '2'),
              SizedBox(width: 12),
              _StatChip(label: 'Daftar lain', value: '8'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _UpcomingTaskCard extends StatelessWidget {
  const _UpcomingTaskCard({required this.task});

  final TaskInfo task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F102033),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: task.accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(task.icon, color: task.accent),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  task.deadlineLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF334155),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            task.course,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.event_available_outlined,
            text: task.additionalInfo,
          ),
          const SizedBox(height: 6),
          _InfoRow(icon: Icons.schedule_outlined, text: task.deadlineDetail),
        ],
      ),
    );
  }
}

class _TaskListItem extends StatelessWidget {
  const _TaskListItem({required this.task});

  final TaskInfo task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5EAF1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: task.accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(task.icon, color: task.accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      task.deadlineLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F766E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  task.course,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    _MiniBadge(
                      icon: Icons.calendar_today_outlined,
                      text: task.deadlineDetail,
                    ),
                    _MiniBadge(
                      icon: Icons.note_outlined,
                      text: task.additionalInfo,
                    ),
                    _MiniBadge(icon: Icons.flag_outlined, text: task.status),
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF64748B)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
          ),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  const _MiniBadge({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF64748B)),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
          ),
        ],
      ),
    );
  }
}

class TaskInfo {
  const TaskInfo({
    required this.title,
    required this.course,
    required this.deadlineLabel,
    required this.deadlineDetail,
    required this.additionalInfo,
    required this.status,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String course;
  final String deadlineLabel;
  final String deadlineDetail;
  final String additionalInfo;
  final String status;
  final IconData icon;
  final Color accent;
}

const List<TaskInfo> _allTasks = [
  TaskInfo(
    title: 'Prototype Dashboard LMS',
    course: 'Mobile Programming',
    deadlineLabel: 'Besok',
    deadlineDetail: '12 Mei 2026 - 23:59',
    additionalInfo: 'Kelompok 2 | 5 file',
    status: 'Urgent',
    icon: Icons.phone_android_outlined,
    accent: Color(0xFF0F766E),
  ),
  TaskInfo(
    title: 'Analisis Kebutuhan Sistem',
    course: 'System Analysis',
    deadlineLabel: '2 hari lagi',
    deadlineDetail: '14 Mei 2026 - 21:00',
    additionalInfo: 'Dokumentasi 10 halaman',
    status: 'High priority',
    icon: Icons.description_outlined,
    accent: Color(0xFF2563EB),
  ),
  TaskInfo(
    title: 'Implementasi Login UI',
    course: 'UI/UX Design',
    deadlineLabel: '3 hari lagi',
    deadlineDetail: '15 Mei 2026 - 18:00',
    additionalInfo: 'Mockup + source code',
    status: 'On track',
    icon: Icons.dashboard_customize_outlined,
    accent: Color(0xFF7C3AED),
  ),
  TaskInfo(
    title: 'Quiz Flutter Widget',
    course: 'Mobile Programming',
    deadlineLabel: '4 hari lagi',
    deadlineDetail: '16 Mei 2026 - 09:00',
    additionalInfo: '20 soal pilihan ganda',
    status: 'Study now',
    icon: Icons.quiz_outlined,
    accent: Color(0xFFEA580C),
  ),
  TaskInfo(
    title: 'Presentasi Progress Proyek',
    course: 'Project Management',
    deadlineLabel: '5 hari lagi',
    deadlineDetail: '17 Mei 2026 - 13:00',
    additionalInfo: 'Slide 12 halaman',
    status: 'Prepare slides',
    icon: Icons.slideshow_outlined,
    accent: Color(0xFF0891B2),
  ),
  TaskInfo(
    title: 'Jurnal Refleksi Mingguan',
    course: 'Soft Skill',
    deadlineLabel: '6 hari lagi',
    deadlineDetail: '18 Mei 2026 - 20:00',
    additionalInfo: 'Format PDF',
    status: 'Easy task',
    icon: Icons.article_outlined,
    accent: Color(0xFF16A34A),
  ),
  TaskInfo(
    title: 'Desain Database Aplikasi',
    course: 'Database Systems',
    deadlineLabel: '7 hari lagi',
    deadlineDetail: '19 Mei 2026 - 22:00',
    additionalInfo: 'ERD + tabel relasi',
    status: 'Need review',
    icon: Icons.storage_outlined,
    accent: Color(0xFFDC2626),
  ),
  TaskInfo(
    title: 'Review Literatur Jurnal',
    course: 'Research Methods',
    deadlineLabel: '8 hari lagi',
    deadlineDetail: '20 Mei 2026 - 17:30',
    additionalInfo: '3 jurnal internasional',
    status: 'Reading',
    icon: Icons.menu_book_outlined,
    accent: Color(0xFF0EA5E9),
  ),
  TaskInfo(
    title: 'Latihan Koding State Management',
    course: 'Mobile Programming',
    deadlineLabel: '9 hari lagi',
    deadlineDetail: '21 Mei 2026 - 19:00',
    additionalInfo: 'Kuis praktik mandiri',
    status: 'Optional',
    icon: Icons.code_outlined,
    accent: Color(0xFF6366F1),
  ),
  TaskInfo(
    title: 'Upload Video Demo',
    course: 'Project Presentation',
    deadlineLabel: '10 hari lagi',
    deadlineDetail: '22 Mei 2026 - 23:00',
    additionalInfo: 'Durasi maksimal 5 menit',
    status: 'Final step',
    icon: Icons.videocam_outlined,
    accent: Color(0xFFDB2777),
  ),
];

final List<TaskInfo> _upcomingTasks = [_allTasks[0], _allTasks[1]];

final List<TaskInfo> _otherTasks = [
  _allTasks[2],
  _allTasks[3],
  _allTasks[4],
  _allTasks[5],
  _allTasks[6],
  _allTasks[7],
  _allTasks[8],
  _allTasks[9],
];
