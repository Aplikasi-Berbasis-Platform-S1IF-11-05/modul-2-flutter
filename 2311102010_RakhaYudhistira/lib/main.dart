import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  final String title;
  final String course;
  final String deadline;
  final String additionalData;
  final Color statusColor;

  const Task(this.title, this.course, this.deadline, this.additionalData, {this.statusColor = Colors.grey});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Mobile',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        fontFamily: 'Inter',
      ),
      home: const LMSDashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LMSDashboardScreen extends StatelessWidget {
  const LMSDashboardScreen({super.key});

  final List<Task> urgentTasks = const [
    Task('Optimasi Model CNN-Transformer', 'Tugas Akhir', 'Hari ini, 23:59', 'Prioritas Tinggi', statusColor: Colors.red),
    Task('Metrics Cyclomatic Complexity', 'VVPL', 'Besok, 10:00', 'Kelompok 4', statusColor: Colors.orange),
  ];

  final List<Task> otherTasks = const [
    Task('Slicing UI Inventory App', 'Mobile Programming', '14 Mei 2026', 'Framework: Flutter'),
    Task('Backend API Development', 'Pemrograman Web', '15 Mei 2026', 'Laravel 11 + Sanctum'),
    Task('Blackbox & Whitebox Testing', 'SQA', '16 Mei 2026', 'Tools: Selenium'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('LMS Dashboard', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const CircleAvatar(radius: 18, backgroundColor: Colors.indigo, child: Icon(Icons.person, color: Colors.white, size: 20)),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Halo, Rakha Yudhistira!", style: TextStyle(fontSize: 16, color: Colors.grey)),
              const Text("Cek progres tugasmu hari ini.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              
              _sectionHeader('Deadline Terdekat'),
              const SizedBox(height: 15),
              
              // GRID VIEW
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 180,
                ),
                itemCount: urgentTasks.length,
                itemBuilder: (context, index) => UrgentTaskCard(task: urgentTasks[index]),
              ),

              const SizedBox(height: 35),
              _sectionHeader('Daftar Tugas Lainnya'),
              const SizedBox(height: 15),

              // LIST VIEW SEPARATED
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherTasks.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) => TaskTile(task: otherTasks[index]),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF1E293B))),
        TextButton(onPressed: () {}, child: const Text("Lihat Semua")),
      ],
    );
  }
}

class UrgentTaskCard extends StatelessWidget {
  final Task task;
  const UrgentTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [task.statusColor.withOpacity(0.9), task.statusColor.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: task.statusColor.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.alarm_on, color: Colors.white, size: 28),
          const Spacer(),
          Text(task.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(task.course, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
          const Divider(color: Colors.white24),
          Text(task.deadline, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade50,
          child: const Icon(Icons.book_outlined, color: Colors.indigo, size: 20),
        ),
        title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.course, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.label_outline, size: 14, color: Colors.grey.shade500),
                const SizedBox(width: 4),
                Text(task.additionalData, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Batas Waktu", style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text(task.deadline, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.indigo)),
          ],
        ),
      ),
    );
  }
}