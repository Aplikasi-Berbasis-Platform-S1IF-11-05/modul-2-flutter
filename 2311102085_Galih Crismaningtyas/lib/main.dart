import 'package:flutter/material.dart';
// 2311102085
// Galih Crismaningtyas
// Modul 2 - Flutter
void main() {
  runApp(const MyApp());
}

class Task {
  final String taskName;
  final String courseName;
  final String deadline;
  final String status;
  final String additionalInfo;
  final Color color;

  Task({
    required this.taskName,
    required this.courseName,
    required this.deadline,
    required this.status,
    required this.additionalInfo,
    required this.color,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Campus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LMS - Tugas Saya'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Data untuk 2 grid dengan deadline terdekat
  final List<Task> recentTasks = [
    Task(
      taskName: 'UTS Algoritma',
      courseName: 'Algoritma & Struktur Data',
      deadline: 'Tomorrow, 10:00 AM',
      status: 'Urgent',
      additionalInfo: '3 Soal Essay',
      color: Colors.red[300]!,
    ),
    Task(
      taskName: 'Project Kelompok',
      courseName: 'Web Development',
      deadline: '2 days left',
      status: 'In Progress',
      additionalInfo: '90% Complete',
      color: Colors.orange[300]!,
    ),
  ];

  // Data untuk ListView (8 tugas lainnya)
  final List<Task> otherTasks = [
    Task(
      taskName: 'Quiz Kalkulus',
      courseName: 'Matematika Lanjut',
      deadline: '3 days - May 15, 2026',
      status: 'Not Started',
      additionalInfo: '10 Soal Multiple Choice',
      color: Colors.yellow[200]!,
    ),
    Task(
      taskName: 'Lab Report Python',
      courseName: 'Pemrograman Dasar',
      deadline: '5 days - May 17, 2026',
      status: 'In Progress',
      additionalInfo: 'Code + Report PDF',
      color: Colors.green[300]!,
    ),
    Task(
      taskName: 'Essay Sejarah Indonesia',
      courseName: 'Sejarah Nasional',
      deadline: '7 days - May 19, 2026',
      status: 'Not Started',
      additionalInfo: '3000 Kata, Times New Roman',
      color: Colors.blue[300]!,
    ),
    Task(
      taskName: 'Tugas Reading',
      courseName: 'Bahasa Inggris',
      deadline: '4 days - May 16, 2026',
      status: 'Not Started',
      additionalInfo: 'Chapter 5-7, Ringkasan 2 halaman',
      color: Colors.purple[300]!,
    ),
    Task(
      taskName: 'Praktikum Database',
      courseName: 'Database Management',
      deadline: '6 days - May 18, 2026',
      status: 'In Progress',
      additionalInfo: 'Query & Database Design',
      color: Colors.indigo[300]!,
    ),
    Task(
      taskName: 'Diskusi Forum',
      courseName: 'Sistem Informasi',
      deadline: '3 days - May 15, 2026',
      status: 'Not Started',
      additionalInfo: 'Minimal 2 Postingan & 2 Reply',
      color: Colors.teal[300]!,
    ),
    Task(
      taskName: 'Tugas Grafis 2D',
      courseName: 'Grafika Komputer',
      deadline: '8 days - May 20, 2026',
      status: 'Not Started',
      additionalInfo: 'Menggunakan OpenGL atau Canvas',
      color: Colors.cyan[300]!,
    ),
    Task(
      taskName: 'Presentasi Projek Akhir',
      courseName: 'Capstone Project',
      deadline: '10 days - May 22, 2026',
      status: 'Not Started',
      additionalInfo: 'PPT + Video Demo (5 menit)',
      color: Colors.pink[300]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section: Tugas dengan Deadline Terdekat (2 Grid)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tugas Terdekat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  // GridView untuk 2 tugas terdekat
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                    children: recentTasks.map((task) {
                      return _buildGridCard(task);
                    }).toList(),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2, indent: 16, endIndent: 16),
            // Section: Daftar Tugas Lainnya
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar Tugas Lainnya',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  // ListView.separated untuk 8 tugas lainnya
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: otherTasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return _buildListCard(otherTasks[index]);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget untuk Grid Card
  Widget _buildGridCard(Task task) {
    return Container(
      decoration: BoxDecoration(
        color: task.color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.taskName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                task.courseName,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  task.status,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade900,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                task.deadline,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk List Card
  Widget _buildListCard(Task task) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Warna indikator di sebelah kiri
            Container(
              width: 5,
              height: 80,
              decoration: BoxDecoration(
                color: task.color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            // Konten utama
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          task.taskName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: task.status == 'In Progress'
                              ? Colors.blue[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          task.status,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: task.status == 'In Progress'
                                ? Colors.blue[900]
                                : Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.courseName,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 12,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            task.deadline,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        task.additionalInfo,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
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
