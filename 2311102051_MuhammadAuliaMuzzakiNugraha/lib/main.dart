import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const LmsApp());
}

void _showTaskSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: TelkomPalette.ink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
}

class LmsApp extends StatelessWidget {
  const LmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light(useMaterial3: true);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: TelkomPalette.red,
      brightness: Brightness.light,
    ).copyWith(
      primary: TelkomPalette.red,
      secondary: TelkomPalette.deepRed,
      surface: TelkomPalette.surface,
      onPrimary: Colors.white,
      onSurface: TelkomPalette.ink,
      outlineVariant: TelkomPalette.outline,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS Dashboard',
      theme: baseTheme.copyWith(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(baseTheme.textTheme)
            .apply(bodyColor: TelkomPalette.ink, displayColor: TelkomPalette.ink),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _headerFade;
  late final Animation<double> _gridFade;
  late final Animation<double> _listFade;
  late final Animation<Offset> _headerSlide;
  late final Animation<Offset> _gridSlide;
  late final Animation<Offset> _listSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _headerFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
    );
    _gridFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.75, curve: Curves.easeOut),
    );
    _listFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
    );

    _headerSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(_headerFade);
    _gridSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(_gridFade);
    _listSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(_listFade);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            const _BackgroundDecoration(),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _animatedSection(
                    fade: _headerFade,
                    slide: _headerSlide,
                    child: _DashboardHeader(textTheme: textTheme),
                  ),
                  const SizedBox(height: 16),
                  _animatedSection(
                    fade: _headerFade,
                    slide: _headerSlide,
                    child: _OverviewCard(
                      dueSoon: deadlineTasks.length,
                      totalTasks: deadlineTasks.length + otherTasks.length,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _animatedSection(
                    fade: _gridFade,
                    slide: _gridSlide,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          title: 'Mendekati Deadline',
                          countLabel: '${deadlineTasks.length} Tugas',
                        ),
                        const SizedBox(height: 12),
                        GridView.builder(
                          itemCount: deadlineTasks.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 0.72,
                          ),
                          itemBuilder: (context, index) {
                            return DeadlineCard(task: deadlineTasks[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _animatedSection(
                    fade: _listFade,
                    slide: _listSlide,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          title: 'Daftar Tugas Lainnya',
                          countLabel: '${otherTasks.length} Tugas',
                        ),
                        const SizedBox(height: 12),
                        ListView.separated(
                          itemCount: otherTasks.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return TaskListTile(task: otherTasks[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Terakhir disinkronkan: 12 Mei 2026, 08:30 WIB',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
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

  Widget _animatedSection({
    required Animation<double> fade,
    required Animation<Offset> slide,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFF5F6),
                  Color(0xFFF5F4F7),
                ],
              ),
            ),
          ),
          Positioned(
            top: -120,
            right: -80,
            child: GlowCircle(color: TelkomPalette.red, size: 240),
          ),
          Positioned(
            bottom: -140,
            left: -80,
            child: GlowCircle(color: TelkomPalette.deepRed, size: 260),
          ),
        ],
      ),
    );
  }
}

class GlowCircle extends StatelessWidget {
  const GlowCircle({super.key, required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.22),
            color.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LMS Dashboard',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Telkom University - Semester Genap 2026',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: TelkomPalette.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: TelkomPalette.red.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'TU',
              style: textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard({required this.dueSoon, required this.totalTasks});

  final int dueSoon;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final progress = totalTasks == 0 ? 0.0 : dueSoon / totalTasks;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [TelkomPalette.red, TelkomPalette.deepRed],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: TelkomPalette.red.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fokus Minggu Ini',
            style: textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _StatPill(
                label: 'Mendekati',
                value: '$dueSoon',
              ),
              const SizedBox(width: 12),
              _StatPill(
                label: 'Total Tugas',
                value: '$totalTasks',
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Progress minggu ini: $dueSoon dari $totalTasks tugas',
            style: textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: Colors.white.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.countLabel});

  final String title;
  final String countLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: TelkomPalette.softPink,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            countLabel,
            style: textTheme.labelMedium?.copyWith(
              color: TelkomPalette.deepRed,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class DeadlineCard extends StatelessWidget {
  const DeadlineCard({super.key, required this.task});

  final DeadlineTask task;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showTaskSnackBar(context, 'Buka ${task.title}'),
        child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: TelkomPalette.surfaceAlt,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateChip(text: task.date, color: task.tagColor),
              const SizedBox(height: 8),
              Text(
                task.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                task.course,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    task.time,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  MetaChip(text: task.tag, color: task.tagColor),
                  MetaChip(text: task.extra, color: TelkomPalette.slate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.task});

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showTaskSnackBar(context, 'Detail ${task.title}'),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: TelkomPalette.surfaceAlt,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: task.accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(task.icon, color: task.accent, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.course,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        MetaChip(text: task.type, color: task.accent),
                        MetaChip(text: task.detail, color: TelkomPalette.slate),
                        if (task.isGroup)
                          MetaChip(
                            text: 'Kelompok',
                            color: TelkomPalette.deepRed,
                          ),
                        if (task.hasAttachment)
                          MetaChip(
                            text: 'Lampiran',
                            color: TelkomPalette.slate,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DateChip(text: task.date, color: TelkomPalette.red),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        task.time,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateChip extends StatelessWidget {
  const DateChip({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MetaChip extends StatelessWidget {
  const MetaChip({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DeadlineTask {
  const DeadlineTask({
    required this.date,
    required this.title,
    required this.course,
    required this.time,
    required this.tag,
    required this.extra,
    required this.tagColor,
  });

  final String date;
  final String title;
  final String course;
  final String time;
  final String tag;
  final String extra;
  final Color tagColor;
}

class TaskItem {
  const TaskItem({
    required this.title,
    required this.course,
    required this.date,
    required this.time,
    required this.type,
    required this.detail,
    required this.icon,
    required this.accent,
    this.isGroup = false,
    this.hasAttachment = false,
  });

  final String title;
  final String course;
  final String date;
  final String time;
  final String type;
  final String detail;
  final IconData icon;
  final Color accent;
  final bool isGroup;
  final bool hasAttachment;
}

class TelkomPalette {
  static const Color red = Color(0xFFE30613);
  static const Color deepRed = Color(0xFFB50E1C);
  static const Color ink = Color(0xFF1B1B1F);
  static const Color slate = Color(0xFF5C5D63);
  static const Color surface = Color(0xFFF7F5F6);
  static const Color surfaceAlt = Color(0xFFFFFFFF);
  static const Color outline = Color(0xFFE2E0E4);
  static const Color softPink = Color(0xFFFFE5E8);
}

const List<DeadlineTask> deadlineTasks = [
  DeadlineTask(
    date: '10 Mei 2026',
    title: 'Tugas 4: Laporan Progres',
    course: 'Informatika Masyarakat',
    time: '15:00 WIB',
    tag: 'Praktikum',
    extra: '1 Berkas',
    tagColor: TelkomPalette.red,
  ),
  DeadlineTask(
    date: '11 Mei 2026',
    title: 'Tugas 10.2b - API',
    course: 'Aplikasi Platform',
    time: '23:59 WIB',
    tag: 'Coding',
    extra: '3 Berkas',
    tagColor: TelkomPalette.deepRed,
  ),
];

const List<TaskItem> otherTasks = [
  TaskItem(
    title: 'Quiz 2',
    course: 'Pemrograman Bergerak',
    date: '15 Mei 2026',
    time: '10:00 WIB',
    type: 'Quiz',
    detail: 'Durasi 60 menit',
    icon: Icons.fact_check_outlined,
    accent: TelkomPalette.red,
  ),
  TaskItem(
    title: 'Review Jurnal AI',
    course: 'Kecerdasan Buatan',
    date: '16 Mei 2026',
    time: '23:59 WIB',
    type: 'Review',
    detail: '2 referensi',
    icon: Icons.auto_stories_outlined,
    accent: TelkomPalette.deepRed,
    hasAttachment: true,
  ),
  TaskItem(
    title: 'Final Project Draft',
    course: 'Desain UI/UX',
    date: '18 Mei 2026',
    time: '23:59 WIB',
    type: 'Draft',
    detail: 'Figma',
    icon: Icons.design_services_outlined,
    accent: TelkomPalette.red,
    hasAttachment: true,
  ),
  TaskItem(
    title: 'Tugas Praktikum 3',
    course: 'Pemrograman Bergerak',
    date: '20 Mei 2026',
    time: '08:00 WIB',
    type: 'Praktikum',
    detail: 'Lab A',
    icon: Icons.laptop_mac_outlined,
    accent: TelkomPalette.deepRed,
  ),
  TaskItem(
    title: 'Latihan Soal UTS',
    course: 'Matematika Diskrit',
    date: '22 Mei 2026',
    time: '17:00 WIB',
    type: 'Latihan',
    detail: '25 soal',
    icon: Icons.task_outlined,
    accent: TelkomPalette.red,
  ),
  TaskItem(
    title: 'Tugas Kelompok 1',
    course: 'Arsitektur Perangkat Lunak',
    date: '23 Mei 2026',
    time: '21:00 WIB',
    type: 'Kelompok',
    detail: 'Presentasi',
    icon: Icons.groups_outlined,
    accent: TelkomPalette.deepRed,
    isGroup: true,
  ),
  TaskItem(
    title: 'Analisis Kasus',
    course: 'Sistem Informasi',
    date: '24 Mei 2026',
    time: '19:00 WIB',
    type: 'Analisis',
    detail: 'Studi kasus',
    icon: Icons.analytics_outlined,
    accent: TelkomPalette.red,
  ),
  TaskItem(
    title: 'Refleksi Mingguan',
    course: 'Etika Profesi',
    date: '25 Mei 2026',
    time: '20:00 WIB',
    type: 'Refleksi',
    detail: '400 kata',
    icon: Icons.edit_note_outlined,
    accent: TelkomPalette.deepRed,
  ),
];