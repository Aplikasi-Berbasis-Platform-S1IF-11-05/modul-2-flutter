import 'package:flutter/material.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiAkad LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B1A1A),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

// ─── Data Model ─────────────────────────────────────────────────────────────

class Assignment {
  final String id;
  final String title;
  final String subject;
  final String subjectCode;
  final DateTime deadline;
  final String type; // 'tugas', 'kuis', 'ujian', 'proyek'
  final int maxScore;
  final String lecturer;
  final String status; // 'belum dikerjakan', 'sedang dikerjakan', 'selesai'
  final String description;
  final bool isOnline; // online submission or physical

  Assignment({
    required this.id,
    required this.title,
    required this.subject,
    required this.subjectCode,
    required this.deadline,
    required this.type,
    required this.maxScore,
    required this.lecturer,
    required this.status,
    required this.description,
    required this.isOnline,
  });

  Duration get timeLeft => deadline.difference(DateTime.now());

  bool get isUrgent => timeLeft.inHours <= 24;
  bool get isWarning => timeLeft.inHours <= 72 && !isUrgent;

  String get timeLeftText {
    if (timeLeft.isNegative) return 'Terlambat!';
    if (timeLeft.inHours < 1) return '${timeLeft.inMinutes}m lagi';
    if (timeLeft.inHours < 24) return '${timeLeft.inHours}j lagi';
    if (timeLeft.inDays < 7) return '${timeLeft.inDays}h lagi';
    return '${(timeLeft.inDays / 7).floor()}mg lagi';
  }
}

// ─── Sample Data ─────────────────────────────────────────────────────────────

final List<Assignment> allAssignments = [
  // TOP 2 — closest deadlines (used in GridView)
  Assignment(
    id: '1',
    title: 'Laporan Praktikum Jaringan',
    subject: 'Jaringan Komputer',
    subjectCode: 'IK3204',
    deadline: DateTime.now().add(const Duration(hours: 8, minutes: 30)),
    type: 'tugas',
    maxScore: 100,
    lecturer: 'Dr. Ahmad Fauzi, M.T.',
    status: 'sedang dikerjakan',
    description: 'Laporan hasil konfigurasi routing OSPF dan BGP',
    isOnline: true,
  ),
  Assignment(
    id: '2',
    title: 'Kuis Pemrograman Web',
    subject: 'Pemrograman Web',
    subjectCode: 'IK2103',
    deadline: DateTime.now().add(const Duration(hours: 20, minutes: 15)),
    type: 'kuis',
    maxScore: 50,
    lecturer: 'Budi Santoso, S.Kom., M.Cs.',
    status: 'belum dikerjakan',
    description: 'Kuis materi HTML5, CSS3, dan JavaScript dasar',
    isOnline: true,
  ),
  // LIST 8 — other assignments (used in ListView)
  Assignment(
    id: '3',
    title: 'Tugas Besar Rekayasa Perangkat Lunak',
    subject: 'Rekayasa Perangkat Lunak',
    subjectCode: 'IK3301',
    deadline: DateTime.now().add(const Duration(days: 3, hours: 5)),
    type: 'proyek',
    maxScore: 200,
    lecturer: 'Prof. Siti Rahayu, Ph.D.',
    status: 'sedang dikerjakan',
    description: 'Pembuatan SRS dan desain UML untuk sistem e-commerce',
    isOnline: false,
  ),
  Assignment(
    id: '4',
    title: 'Essay Etika Profesi IT',
    subject: 'Etika Profesi',
    subjectCode: 'IK1001',
    deadline: DateTime.now().add(const Duration(days: 4, hours: 12)),
    type: 'tugas',
    maxScore: 75,
    lecturer: 'Dra. Maria Ningsih, M.Hum.',
    status: 'belum dikerjakan',
    description: 'Essay 1500 kata tentang privasi data di era digital',
    isOnline: true,
  ),
  Assignment(
    id: '5',
    title: 'Ujian Tengah Semester Basis Data',
    subject: 'Basis Data',
    subjectCode: 'IK2201',
    deadline: DateTime.now().add(const Duration(days: 5, hours: 9)),
    type: 'ujian',
    maxScore: 100,
    lecturer: 'Dr. Hendra Wijaya, M.T.',
    status: 'belum dikerjakan',
    description: 'UTS mencakup materi ERD, normalisasi, dan query SQL lanjutan',
    isOnline: false,
  ),
  Assignment(
    id: '6',
    title: 'Implementasi Algoritma Sorting',
    subject: 'Struktur Data & Algoritma',
    subjectCode: 'IK2102',
    deadline: DateTime.now().add(const Duration(days: 6, hours: 16)),
    type: 'tugas',
    maxScore: 100,
    lecturer: 'Agus Prasetyo, S.T., M.T.',
    status: 'sedang dikerjakan',
    description:
        'Implementasi merge sort, quick sort, dan heap sort dalam Python',
    isOnline: true,
  ),
  Assignment(
    id: '7',
    title: 'Analisis Keamanan Sistem',
    subject: 'Keamanan Informasi',
    subjectCode: 'IK4101',
    deadline: DateTime.now().add(const Duration(days: 8, hours: 7)),
    type: 'proyek',
    maxScore: 150,
    lecturer: 'Dr. Rizky Permana, M.Cs.',
    status: 'belum dikerjakan',
    description:
        'Penetration testing pada web aplikasi dummy menggunakan OWASP',
    isOnline: true,
  ),
  Assignment(
    id: '8',
    title: 'Presentasi Sistem Operasi',
    subject: 'Sistem Operasi',
    subjectCode: 'IK3102',
    deadline: DateTime.now().add(const Duration(days: 10, hours: 13)),
    type: 'tugas',
    maxScore: 80,
    lecturer: 'Drs. Bambang Sutrisno, M.T.',
    status: 'belum dikerjakan',
    description:
        'Presentasi kelompok tentang perbandingan kernel Linux dan Windows',
    isOnline: false,
  ),
  Assignment(
    id: '9',
    title: 'Proyek Machine Learning',
    subject: 'Kecerdasan Buatan',
    subjectCode: 'IK4201',
    deadline: DateTime.now().add(const Duration(days: 12, hours: 10)),
    type: 'proyek',
    maxScore: 250,
    lecturer: 'Prof. Diana Kusuma, Ph.D.',
    status: 'sedang dikerjakan',
    description: 'Klasifikasi gambar menggunakan CNN dengan dataset CIFAR-10',
    isOnline: true,
  ),
  Assignment(
    id: '10',
    title: 'Kuis Matematika Diskrit',
    subject: 'Matematika Diskrit',
    subjectCode: 'MA2101',
    deadline: DateTime.now().add(const Duration(days: 14, hours: 8)),
    type: 'kuis',
    maxScore: 50,
    lecturer: 'Dr. Laila Fitriani, M.Si.',
    status: 'belum dikerjakan',
    description:
        'Kuis materi teori graf, kombinatorika, dan logika proposisional',
    isOnline: true,
  ),
];

List<Assignment> get urgentAssignments {
  final sorted = List<Assignment>.from(allAssignments)
    ..sort((a, b) => a.deadline.compareTo(b.deadline));
  return sorted.take(2).toList();
}

List<Assignment> get otherAssignments {
  final sorted = List<Assignment>.from(allAssignments)
    ..sort((a, b) => a.deadline.compareTo(b.deadline));
  return sorted.skip(2).take(8).toList();
}

// ─── Color & Style Constants ──────────────────────────────────────────────────

const kRed = Color(0xFF8B1A1A);
const kRedDark = Color(0xFF6B1414);
const kRedLight = Color(0xFFB22222);
const kRedSurface = Color(0xFFFFF5F5);
const kRedBorder = Color(0xFFEBCCCC);
const kWhite = Color(0xFFFFFFFF);
const kGrey = Color(0xFF6B7280);
const kGreyLight = Color(0xFFF3F4F6);

// ─── Home Page ────────────────────────────────────────────────────────────────

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final urgent = urgentAssignments;
    final others = otherAssignments;

    return Scaffold(
      backgroundColor: kGreyLight,
      appBar: _buildAppBar(context),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: others.length + 3, // header + grid + divider + 8 list items
        separatorBuilder: (_, index) {
          // Separator only between list items (after index 2 = grid section)
          if (index >= 2) {
            return const Divider(
              height: 1,
              indent: 16,
              endIndent: 16,
              color: kRedBorder,
            );
          }
          return const SizedBox.shrink();
        },
        itemBuilder: (context, index) {
          if (index == 0) return _buildGreetingSection();
          if (index == 1) return _buildUrgentGridSection(urgent);
          if (index == 2) return _buildListHeader();
          // index 3..10 => others[0..7]
          return _buildAssignmentTile(context, others[index - 3]);
        },
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kRed,
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: kWhite.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'S',
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SiAkad LMS',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
              Text(
                'Universitas Telkom',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: kWhite),
              onPressed: () {},
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFD700),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 17,
            backgroundColor: kWhite.withOpacity(0.2),
            child: const Text(
              'FK',
              style: TextStyle(
                color: kWhite,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Greeting Section ───────────────────────────────────────────────────────

  Widget _buildGreetingSection() {
    final now = DateTime.now();
    final hour = now.hour;
    String greeting;
    if (hour < 11) {
      greeting = 'Selamat Pagi';
    } else if (hour < 15) {
      greeting = 'Selamat Siang';
    } else if (hour < 18) {
      greeting = 'Selamat Sore';
    } else {
      greeting = 'Selamat Malam';
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kRed, kRedLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: kRed.withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$greeting, Fitri Kusumaningtyas!',
                  style: const TextStyle(
                    color: kWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kamu punya 10 tugas aktif minggu ini.',
                  style: TextStyle(color: Colors.white70, fontSize: 12.5),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _statChip(Icons.assignment_outlined, '6 Belum'),
                    const SizedBox(width: 8),
                    _statChip(Icons.pending_outlined, '4 Proses'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: kWhite.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.school_outlined,
              color: kWhite,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: kWhite.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: kWhite, size: 13),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: kWhite,
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ── Urgent Grid Section ───────────────────────────────────────────────────

  Widget _buildUrgentGridSection(List<Assignment> urgent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 18,
                decoration: BoxDecoration(
                  color: kRed,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Deadline Terdekat',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kRedDark,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: kRed,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: urgent.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) =>
                _buildUrgentCard(context, urgent[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildUrgentCard(BuildContext context, Assignment a) {
    final isVeryUrgent = a.timeLeft.inHours <= 12;

    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isVeryUrgent ? kRedLight : kRedBorder,
          width: isVeryUrgent ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: kRed.withOpacity(0.10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: type badge + alarm icon
            Row(
              children: [
                _typeBadge(a.type),
                const Spacer(),
                Icon(
                  Icons.alarm,
                  size: 15,
                  color: isVeryUrgent ? kRedLight : kGrey,
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Title
            Text(
              a.title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            // Subject
            Row(
              children: [
                const Icon(Icons.book_outlined, size: 12, color: kGrey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    a.subject,
                    style: const TextStyle(
                      fontSize: 11,
                      color: kGrey,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              a.subjectCode,
              style: const TextStyle(
                fontSize: 10.5,
                color: kRed,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            // Countdown chip
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                color: isVeryUrgent ? kRed : kRedSurface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.schedule,
                    size: 12,
                    color: isVeryUrgent ? kWhite : kRed,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    a.timeLeftText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isVeryUrgent ? kWhite : kRed,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Status + score
            Row(
              children: [
                _statusDot(a.status),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    a.status,
                    style: const TextStyle(fontSize: 10, color: kGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${a.maxScore} pts',
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: kRed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── List Header ────────────────────────────────────────────────────────────

  Widget _buildListHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: kRed,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Semua Tugas',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kRedDark,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: kRedSurface,
              border: Border.all(color: kRedBorder),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '8 tugas',
              style: TextStyle(
                color: kRed,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Assignment List Tile ───────────────────────────────────────────────────

  Widget _buildAssignmentTile(BuildContext context, Assignment a) {
    return Container(
      color: kWhite,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: icon column
          Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: kRedSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kRedBorder),
                ),
                child: Center(
                  child: Icon(
                    _typeIcon(a.type),
                    color: kRed,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              _statusDot(a.status),
            ],
          ),
          const SizedBox(width: 12),
          // Middle: content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _typeBadge(a.type),
                    const SizedBox(width: 6),
                    if (a.isOnline)
                      _smallChip(Icons.cloud_upload_outlined, 'Online')
                    else
                      _smallChip(Icons.print_outlined, 'Fisik'),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  a.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${a.subject} • ${a.subjectCode}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: kRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  a.description,
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: kGrey,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    _infoChip(
                      Icons.schedule_outlined,
                      _formatDate(a.deadline),
                      a.isWarning ? Colors.orange.shade700 : kGrey,
                    ),
                    _infoChip(
                      Icons.person_outline,
                      a.lecturer.split(',').first,
                      kGrey,
                    ),
                    _infoChip(
                      Icons.star_outline,
                      '${a.maxScore} pts',
                      kRed,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Right: time left
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: a.isWarning ? Colors.orange.shade50 : kRedSurface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: a.isWarning ? Colors.orange.shade200 : kRedBorder,
                  ),
                ),
                child: Text(
                  a.timeLeftText,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: a.isWarning ? Colors.orange.shade700 : kRed,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Icon(
                Icons.chevron_right,
                color: kGrey,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Helper Widgets ───────────────────────────────────────────────────────

  Widget _typeBadge(String type) {
    final map = {
      'tugas': (const Color(0xFF1D4ED8), 'Tugas'),
      'kuis': (const Color(0xFF047857), 'Kuis'),
      'ujian': (kRed, 'Ujian'),
      'proyek': (const Color(0xFF7C3AED), 'Proyek'),
    };
    final data = map[type] ?? (kGrey, type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: (data.$1 as Color).withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        data.$2 as String,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: data.$1 as Color,
        ),
      ),
    );
  }

  Widget _smallChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: kGreyLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: kGrey),
          const SizedBox(width: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: kGrey),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 3),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: color),
        ),
      ],
    );
  }

  Widget _statusDot(String status) {
    final color = status == 'selesai'
        ? const Color(0xFF059669)
        : status == 'sedang dikerjakan'
            ? const Color(0xFFD97706)
            : kRed;
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  IconData _typeIcon(String type) {
    switch (type) {
      case 'kuis':
        return Icons.quiz_outlined;
      case 'ujian':
        return Icons.school_outlined;
      case 'proyek':
        return Icons.folder_outlined;
      default:
        return Icons.assignment_outlined;
    }
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Ags',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return '${dt.day} ${months[dt.month - 1]}, ${dt.hour.toString().padLeft(2, '0')}.${dt.minute.toString().padLeft(2, '0')}';
  }
}
