// 2311102090-Buswiryawan Raditya Boenyamin
import 'package:flutter/material.dart';

class AssignmentItem {
  final String date;
  final String time;
  final String title;
  final String subtitle;
  final String status;
  final bool isOverdue;

  AssignmentItem({
    required this.date,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.isOverdue,
  });
}

class LmsDashboard extends StatefulWidget {
  const LmsDashboard({super.key});

  @override
  State<LmsDashboard> createState() => _LmsDashboardState();
}

class _LmsDashboardState extends State<LmsDashboard> {
  final Color telkomRed = const Color(0xFFE31E24);
  int _selectedIndex = 2; // Dashboard tab selected

  final List<AssignmentItem> allAssignments = [
    // 2 Tugas Terdekat (Untuk Grid)
    AssignmentItem(
      date: 'Jumat, 1 Mei 2026',
      time: '23:59',
      title: 'Presentasi Progress Tubes 1 Web',
      subtitle: 'APLIKASI BERBASIS PLATFORM PS1...',
      status: 'Overdue',
      isOverdue: true,
    ),
    AssignmentItem(
      date: 'Sabtu, 2 Mei 2026',
      time: '12:00',
      title: 'Laporan Mingguan Praktikum',
      subtitle: 'STRATEGI ALGORITMA IF-45-01',
      status: 'Overdue',
      isOverdue: true,
    ),
    // 8 Tugas Sisanya (Untuk List)
    AssignmentItem(
      date: 'Jumat, 15 Mei 2026',
      time: '15:00',
      title: 'Tugas 4 : Pengumpulan Bukti Pr...',
      subtitle: 'INFORMATIKA UNTUK MASYARAKA...',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Minggu, 31 Mei 2026',
      time: '23:59',
      title: 'Artefak TUBES 1 Web',
      subtitle: 'APLIKASI BERBASIS PLATFORM PS1...',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Minggu, 7 Juni 2026',
      time: '23:59',
      title: 'Artefak TUBES 2 Mobile',
      subtitle: 'APLIKASI BERBASIS PLATFORM PS1...',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Jumat, 19 Juni 2026',
      time: '23:59',
      title: 'Dokumentasi TUBES Combined',
      subtitle: 'APLIKASI BERBASIS PLATFORM PS1...',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Senin, 22 Juni 2026',
      time: '08:00',
      title: 'Quiz 2 : Database Security',
      subtitle: 'SISTEM BASIS DATA TERDISTRIBUSI',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Rabu, 24 Juni 2026',
      time: '23:59',
      title: 'Final Report UI/UX Design',
      subtitle: 'INTERAKSI MANUSIA DAN KOMPUTER',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Jumat, 26 Juni 2026',
      time: '17:00',
      title: 'Tugas Analisis Jaringan',
      subtitle: 'JARINGAN KOMPUTER LANJUT',
      status: '',
      isOverdue: false,
    ),
    AssignmentItem(
      date: 'Sabtu, 27 Juni 2026',
      time: '13:00',
      title: 'Review Jurnal Metodologi',
      subtitle: 'METODOLOGI PENELITIAN',
      status: '',
      isOverdue: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final gridTasks = allAssignments.take(2).toList();
    final listTasks = allAssignments.skip(2).take(8).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar Area
            _buildStatusBar(),

            // Header Section
            _buildHeader(),

            // Navigation Tabs
            _buildNavTabs(),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TIMELINE Header
                    _buildSectionHeader('TIMELINE'),

                    // Timeline Search & Filter
                    _buildSearchAndFilter(),

                    // 1. GridView untuk 2 Tugas Terdekat
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65, // Disesuaikan agar muat info & button
                        ),
                        itemCount: gridTasks.length,
                        itemBuilder: (context, index) => _buildGridCard(gridTasks[index]),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // LIST TUGAS LAINNYA Section
                    _buildSectionHeader('DAFTAR TUGAS LAINNYA'),

                    // 2. ListView untuk 8 Tugas Sisanya
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      itemCount: listTasks.length,
                      itemBuilder: (context, index) => _buildAssignmentCard(listTasks[index]),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            _buildBottomNav(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: telkomRed,
        shape: const CircleBorder(),
        elevation: 4,
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildStatusBar() {
    return Container(
      color: telkomRed,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('10.30', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          const Row(
            children: [
              Icon(Icons.alarm, color: Colors.white, size: 14),
              SizedBox(width: 4),
              Icon(Icons.wifi, color: Colors.white, size: 14),
              SizedBox(width: 4),
              Icon(Icons.signal_cellular_alt, color: Colors.white, size: 14),
              SizedBox(width: 4),
              Text('VoLTE2', style: TextStyle(color: Colors.white, fontSize: 10)),
              SizedBox(width: 4),
              Icon(Icons.battery_full, color: Colors.white, size: 14),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey[300],
            child: const Text('BB', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Learning Management System', style: TextStyle(fontSize: 13, color: Colors.black54)),
                Text(
                  'BUSWIRYAWAN RADITYA\nBOENYAMIN',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black, height: 1.2),
                ),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.search, color: Colors.black54, size: 24), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildNavTabs() {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavTab('OCW', Icons.book_outlined, false),
          _buildNavTab('News & Event', Icons.home_outlined, false),
          _buildNavTab('Dashboard', Icons.bar_chart, true),
        ],
      ),
    );
  }

  Widget _buildNavTab(String label, IconData icon, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: isSelected ? Border(bottom: BorderSide(color: telkomRed, width: 3)) : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: isSelected ? telkomRed : Colors.black54),
            const SizedBox(width: 5),
            Text(label, style: TextStyle(fontSize: 13, color: isSelected ? telkomRed : Colors.black54, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      color: telkomRed,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
    );
  }

  Widget _buildSearchAndFilter() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(25)),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by activity type or name',
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey[400]!), borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    const Text('All', style: TextStyle(fontSize: 15)),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: Colors.grey[600], size: 20),
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.swap_vert, color: Colors.grey[700], size: 22), onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridCard(AssignmentItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(color: const Color(0xFFE91E8C), borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.upload_file, color: Colors.white, size: 20),
                    ),
                    if (item.status.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: telkomRed, borderRadius: BorderRadius.circular(10)),
                        child: Text(item.status, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(item.date, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                if (item.time.isNotEmpty)
                  Text(item.time, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                const SizedBox(height: 8),
                Text(item.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(item.subtitle, style: TextStyle(fontSize: 11, color: Colors.grey[600]), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey[400]!),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                minimumSize: const Size(double.infinity, 32),
                padding: EdgeInsets.zero,
              ),
              child: const Text('Kirimkan', style: TextStyle(color: Colors.black87, fontSize: 11)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard(AssignmentItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Text(item.date, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.time.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Text(item.time, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                      ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(color: const Color(0xFFE91E8C), borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.upload_file, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          if (item.status.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.only(top: 4, bottom: 4),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(color: telkomRed, borderRadius: BorderRadius.circular(12)),
                              child: Text(item.status, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                            ),
                          if (item.subtitle.isNotEmpty)
                            Text(item.subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[600]), maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 3),
                          Text('Penugasan jatuh tempo', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[400]!),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('Kirimkan Pengajuan (Tugas/Laporan)', style: TextStyle(color: Colors.black87, fontSize: 13)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, -3))]),
      child: SafeArea(
        top: false,
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.notifications_none_outlined, 0, badge: true),
              _buildBottomNavItem(Icons.calendar_today_outlined, 1),
              _buildBottomNavItem(Icons.home, 2, isCenter: true),
              _buildBottomNavItem(Icons.layers_outlined, 3),
              _buildBottomNavItem(Icons.menu, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, int index, {bool isCenter = false, bool badge = false}) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        width: isCenter ? 56 : 44,
        height: isCenter ? 56 : 44,
        decoration: isCenter ? BoxDecoration(color: telkomRed, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 3))]) : null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, color: isCenter ? Colors.white : (_selectedIndex == index ? telkomRed : Colors.black54), size: isCenter ? 26 : 22),
            if (badge)
              Positioned(top: 6, right: 6, child: Container(width: 16, height: 16, decoration: BoxDecoration(color: telkomRed, shape: BoxShape.circle), child: const Center(child: Text('1', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))))),
          ],
        ),
      ),
    );
  }
}
