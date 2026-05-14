import 'package:flutter/material.dart';

const Color _primaryRed = Color(0xFFEF3340);
const Color _darkRed = Color(0xFFC1121F);
const Color _backgroundColor = Color(0xFFFFF7F7);
const Color _cardColor = Color(0xFFFFFFFF);
const Color _textPrimary = Color(0xFF111827);
const Color _textSecondary = Color(0xFF64748B);
const Color _softBorder = Color(0xFFE5E7EB);
const Color _softRedBackground = Color(0xFFFDE2E4);
const Color _softBlueBackground = Color(0xFFE0F2FE);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Modul 2 Flutter - LMS Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: _backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryRed,
          primary: _primaryRed,
          secondary: _darkRed,
          surface: _cardColor,
        ),
        fontFamily: 'sans-serif',
      ),
      home: const LmsDashboardPage(),
    );
  }
}

class TaskItem {
  const TaskItem({
    required this.title,
    required this.course,
    required this.date,
    required this.time,
    required this.type,
    required this.extra,
  });

  final String title;
  final String course;
  final String date;
  final String time;
  final String type;
  final String extra;
}

const List<TaskItem> deadlineTasks = [
  TaskItem(
    title: 'Tugas 4: Bukti Progress',
    course: 'Informatika untuk Masyarakat',
    date: 'Jumat, 15 Mei 2026',
    time: '15:00 WIB',
    type: 'Prioritas',
    extra: '1 Berkas',
  ),
  TaskItem(
    title: 'Tugas 10.2b - Networking 2',
    course: 'Aplikasi Berbasis Platform',
    date: 'Senin, 18 Mei 2026',
    time: '23:59 WIB',
    type: 'Coding',
    extra: '1 Berkas',
  ),
];

const List<TaskItem> otherTasks = [
  TaskItem(
    title: 'Artefak TUBES 1 Web',
    course: 'Aplikasi Berbasis Platform',
    date: 'Minggu, 31 Mei 2026',
    time: '23:59 WIB',
    type: 'Web',
    extra: 'Figma / Repository',
  ),
  TaskItem(
    title: 'Artefak TUBES 2 Mobile',
    course: 'Aplikasi Berbasis Platform',
    date: 'Minggu, 7 Juni 2026',
    time: '23:59 WIB',
    type: 'Mobile',
    extra: 'Flutter Project',
  ),
  TaskItem(
    title: 'Dokumentasi TUBES Combined',
    course: 'Aplikasi Berbasis Platform',
    date: 'Jumat, 19 Juni 2026',
    time: '23:59 WIB',
    type: 'Dokumentasi',
    extra: 'Laporan akhir',
  ),
  TaskItem(
    title: 'Quiz 2',
    course: 'Pemrograman Berbasis Platform',
    date: 'Jumat, 15 Mei 2026',
    time: '10:00 WIB',
    type: 'Quiz',
    extra: 'Durasi 60 menit',
  ),
  TaskItem(
    title: 'Review Jurnal',
    course: 'Kecerdasan Buatan',
    date: 'Senin, 25 Mei 2026',
    time: '20:00 WIB',
    type: 'Referensi',
    extra: '2 referensi',
  ),
  TaskItem(
    title: 'Final Project UI/UX',
    course: 'Desain UI/UX',
    date: 'Jumat, 29 Mei 2026',
    time: '23:59 WIB',
    type: 'Draft',
    extra: 'Prototype Figma',
  ),
  TaskItem(
    title: 'Laporan Praktikum',
    course: 'Jaringan Komputer',
    date: 'Rabu, 3 Juni 2026',
    time: '18:00 WIB',
    type: 'Laporan',
    extra: 'PDF',
  ),
  TaskItem(
    title: 'Presentasi Tugas Besar',
    course: 'Rekayasa Perangkat Lunak',
    date: 'Senin, 8 Juni 2026',
    time: '13:00 WIB',
    type: 'Presentasi',
    extra: 'Slide PPT',
  ),
];

class LmsDashboardPage extends StatelessWidget {
  const LmsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  buildHeader(),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: -74,
                    child: buildProfileCard(),
                  ),
                ],
              ),
              const SizedBox(height: 92),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildWeeklyOverview(),
                    const SizedBox(height: 24),
                    buildSectionHeader('Deadline Mendesak', '2 Tugas'),
                    const SizedBox(height: 14),
                    buildDeadlineGrid(),
                    const SizedBox(height: 24),
                    buildSectionHeader('Semua Tugas', 'filter'),
                    const SizedBox(height: 14),
                    buildTaskList(),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: _softBorder),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          foregroundColor: _primaryRed,
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        label: const Text(
                          'Lihat Semua Tugas',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 210,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_primaryRed, _darkRed],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -28,
            right: -22,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 22,
            left: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Halo, Reyhan!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Siap belajar hari ini?',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.90),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.70)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_primaryRed, _darkRed],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white24,
                    child: Text(
                      'RA',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reyhan Aldiansyah',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: _textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Informatika - Semester Genap 2026',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: _textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              _buildInfoPill(Icons.verified_user_outlined, 'Mahasiswa'),
              _buildInfoPill(Icons.badge_outlined, '2311102082'),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              buildChip('144 SKS', _softRedBackground, _primaryRed),
              const SizedBox(width: 10),
              buildChip('3.85 IPK', _softBlueBackground, const Color(0xFF1D4ED8)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildWeeklyOverview() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _softBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Minggu Ini',
            style: TextStyle(
              color: _textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  icon: Icons.assignment_late_outlined,
                  value: '2',
                  label: 'Mendekati Deadline',
                  backgroundColor: _softRedBackground,
                  iconColor: _primaryRed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  icon: Icons.task_alt_rounded,
                  value: '10',
                  label: 'Total Tugas',
                  backgroundColor: _softBlueBackground,
                  iconColor: const Color(0xFF0F766E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: const LinearProgressIndicator(
              value: 0.2,
              minHeight: 10,
              backgroundColor: _softBorder,
              valueColor: AlwaysStoppedAnimation<Color>(_primaryRed),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '2 dari 10 tugas perlu diprioritaskan minggu ini',
            style: TextStyle(
              color: _textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title, String trailing) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: _textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (trailing == 'filter')
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _softBorder),
            ),
            child: const Icon(
              Icons.tune_rounded,
              size: 18,
              color: _textSecondary,
            ),
          )
        else
          Text(
            trailing,
            style: const TextStyle(
              color: _textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }

  Widget buildDeadlineGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = (constraints.maxWidth - 14) / 2;
        final double itemHeight = itemWidth * 1.18;

        return Column(
          children: [
            // GridView sesuai ketentuan tugas untuk 2 deadline terdekat
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: deadlineTasks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: itemWidth / itemHeight,
              ),
              itemBuilder: (context, index) {
                return buildDeadlineCard(deadlineTasks[index], index);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildDeadlineCard(TaskItem task, int index) {
    final bool isPriority = task.type == 'Prioritas';
    final Color accentColor = isPriority ? _primaryRed : const Color(0xFF1D4ED8);
    final Color accentBackground =
        isPriority ? _softRedBackground : _softBlueBackground;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _softBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: accentBackground,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isPriority ? Icons.priority_high_rounded : Icons.code_rounded,
                  color: accentColor,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: buildChip(task.type, accentBackground, accentColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            task.course,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textSecondary,
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),
          const Spacer(),
          _buildDeadlineInfoRow(Icons.calendar_today_outlined, task.date),
          const SizedBox(height: 8),
          _buildDeadlineInfoRow(Icons.access_time_rounded, task.time),
          const SizedBox(height: 8),
          _buildDeadlineInfoRow(Icons.folder_open_outlined, task.extra),
        ],
      ),
    );
  }

  Widget buildTaskList() {
    // ListView.separated sesuai ketentuan tugas untuk daftar tugas lainnya
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: otherTasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return buildTaskListTile(otherTasks[index], index);
      },
    );
  }

  Widget buildTaskListTile(TaskItem task, int index) {
    final _TaskStyle style = _resolveTaskStyle(task.type, index);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _softBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: style.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(style.icon, color: style.accentColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          height: 1.25,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: buildChip(
                        task.type,
                        style.backgroundColor,
                        style.accentColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  task.course,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    _buildMetaItem(Icons.calendar_today_outlined, task.date),
                    _buildMetaItem(Icons.access_time_rounded, task.time),
                    _buildMetaItem(Icons.folder_open_outlined, task.extra),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        child: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _cardColor,
          elevation: 0,
          selectedItemColor: _primaryRed,
          unselectedItemColor: _textSecondary,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment_rounded),
              label: 'Tugas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_month_rounded),
              label: 'Kalender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profil',
            ),
          ],
          onTap: (_) {},
        ),
      ),
    );
  }

  Widget buildChip(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              color: _textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textSecondary,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeadlineInfoRow(IconData icon, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: _textSecondary),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetaItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: _textSecondary),
        const SizedBox(width: 5),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 180),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildInfoPill(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _softBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: _textSecondary),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              color: _textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  _TaskStyle _resolveTaskStyle(String type, int index) {
    const List<_TaskStyle> styles = [
      _TaskStyle(Icons.language_rounded, Color(0xFFFFEDD5), Color(0xFFEA580C)),
      _TaskStyle(Icons.phone_android_rounded, _softBlueBackground, Color(0xFF1D4ED8)),
      _TaskStyle(Icons.description_outlined, Color(0xFFEDE9FE), Color(0xFF7C3AED)),
      _TaskStyle(Icons.quiz_outlined, _softRedBackground, _primaryRed),
      _TaskStyle(Icons.menu_book_rounded, Color(0xFFDCFCE7), Color(0xFF15803D)),
      _TaskStyle(Icons.draw_outlined, Color(0xFFFCE7F3), Color(0xFFDB2777)),
      _TaskStyle(Icons.article_outlined, Color(0xFFE0F2FE), Color(0xFF0369A1)),
      _TaskStyle(Icons.slideshow_outlined, Color(0xFFFEF3C7), Color(0xFFD97706)),
    ];

    return styles[index % styles.length];
  }
}

class _TaskStyle {
  const _TaskStyle(this.icon, this.backgroundColor, this.accentColor);

  final IconData icon;
  final Color backgroundColor;
  final Color accentColor;
}
