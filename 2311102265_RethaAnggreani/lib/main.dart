import 'package:flutter/material.dart';
// 2311102265_Retha Anggreani - Tugas 2 - LMS Mobile
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar Tugas'),
    );
  }
}

// Model untuk Task
class Task {
  final String id;
  final String title;
  final String course;
  final String deadline;
  final int daysUntilDeadline;
  final String description;
  final String status; // 'pending', 'submitted', 'graded'
  final String professor;

  Task({
    required this.id,
    required this.title,
    required this.course,
    required this.deadline,
    required this.daysUntilDeadline,
    required this.description,
    required this.status,
    required this.professor,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Task> priorityTasks;
  late List<Task> allTasks;

  @override
  void initState() {
    super.initState();
    _initializeTasks();
  }

  void _initializeTasks() {
    allTasks = [
      Task(
        id: '1',
        title: 'Quiz 1 - Algoritma Dasar',
        course: 'Algoritma & Pemrograman',
        deadline: '15 Mei 2026',
        daysUntilDeadline: 3,
        description: 'Quiz tentang konsep dasar algoritma',
        status: 'pending',
        professor: 'Dr. Bambang S.',
      ),
      Task(
        id: '2',
        title: 'Tugas Praktikum Database',
        course: 'Basis Data',
        deadline: '16 Mei 2026',
        daysUntilDeadline: 4,
        description: 'Buat query SQL kompleks',
        status: 'pending',
        professor: 'Prof. Siti A.',
      ),
      Task(
        id: '3',
        title: 'Review Buku - OOP Concept',
        course: 'Pemrograman OOP',
        deadline: '20 Mei 2026',
        daysUntilDeadline: 8,
        description: 'Baca dan review buku OOP',
        status: 'pending',
        professor: 'Dr. Ahmad R.',
      ),
      Task(
        id: '4',
        title: 'UTS Teori Komputasi',
        course: 'Teori Komputasi',
        deadline: '25 Mei 2026',
        daysUntilDeadline: 13,
        description: 'Ujian tengah semester online',
        status: 'pending',
        professor: 'Prof. Hendra K.',
      ),
      Task(
        id: '5',
        title: 'Project Akhir Web Dev',
        course: 'Web Development',
        deadline: '30 Mei 2026',
        daysUntilDeadline: 18,
        description: 'Buat website e-commerce',
        status: 'pending',
        professor: 'Dr. Rina M.',
      ),
      Task(
        id: '6',
        title: 'Paper - Machine Learning',
        course: 'Machine Learning',
        deadline: '28 Mei 2026',
        daysUntilDeadline: 16,
        description: 'Tulis paper tentang neural networks',
        status: 'pending',
        professor: 'Prof. Didi S.',
      ),
      Task(
        id: '7',
        title: 'Laporan Praktikum Network',
        course: 'Jaringan Komputer',
        deadline: '22 Mei 2026',
        daysUntilDeadline: 10,
        description: 'Buat laporan praktikum IP subnetting',
        status: 'pending',
        professor: 'Dr. Budi W.',
      ),
      Task(
        id: '8',
        title: 'Presentasi Proyek Capstone',
        course: 'Capstone Project',
        deadline: '27 Mei 2026',
        daysUntilDeadline: 15,
        description: 'Presentasi hasil proyek capstone',
        status: 'pending',
        professor: 'Prof. Joko T.',
      ),
    ];

    // Ambil 2 tugas dengan deadline paling dekat
    allTasks.sort((a, b) => a.daysUntilDeadline.compareTo(b.daysUntilDeadline));
    priorityTasks = allTasks.take(2).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6200EE),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Semester 6 - 2025/2026',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'J',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sektion Priority Tasks (GridView 2 Kolom)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tugas Prioritas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tugas dengan deadline terdekat',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // GridView untuk priority tasks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.0,
                ),
                itemCount: priorityTasks.length,
                itemBuilder: (context, index) {
                  return _buildPriorityTaskCard(priorityTasks[index]);
                },
              ),
            ),
            // Sektion All Tasks
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Semua Tugas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${allTasks.length} tugas tersedia',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // ListView untuk semua tasks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allTasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildTaskListItem(allTasks[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityTaskCard(Task task) {
    Color statusColor;
    IconData statusIcon;

    if (task.daysUntilDeadline <= 3) {
      statusColor = Colors.red;
      statusIcon = Icons.warning_rounded;
    } else if (task.daysUntilDeadline <= 7) {
      statusColor = Colors.orange;
      statusIcon = Icons.schedule;
    } else {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [statusColor.withOpacity(0.1), statusColor.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: statusColor.withOpacity(0.3), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    Icon(statusIcon, color: statusColor, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  task.course,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${task.daysUntilDeadline} hari lagi',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task.deadline,
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskListItem(Task task) {
    Color statusColor;
    String statusText;

    if (task.daysUntilDeadline <= 3) {
      statusColor = Colors.red;
      statusText = 'Urgent';
    } else if (task.daysUntilDeadline <= 7) {
      statusColor = Colors.orange;
      statusText = 'Segera';
    } else {
      statusColor = Colors.green;
      statusText = 'Normal';
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status indicator
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          task.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          statusText,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.course,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        task.deadline,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.person, size: 12, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        task.professor,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Arrow
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
