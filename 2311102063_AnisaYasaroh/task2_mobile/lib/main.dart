import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> priorityTasks = [
    {
      "title": "Modul-2 Flutter",
      "course": "Praktikum Aplikasi Berbasis Platform",
      "deadline": "13 Mei 2026",
      "color": Colors.pink,
    },
    {
      "title": "Dokumentasi TUBES",
      "course": "Computing Project",
      "deadline": "13 Mei 2026",
      "color": Colors.orange,
    },
  ];

  final List<Map<String, String>> taskList = [
    {
      "title": "Tugas Big Data",
      "course": "Big Data",
      "deadline": "20 Mei 2026",
    },
    {
      "title": "Quiz AI",
      "course": "Kecerdasan Artifisial",
      "deadline": "22 Mei 2026",
    },
    {
      "title": "Laporan MAL",
      "course": "Computing Project",
      "deadline": "25 Mei 2026",
    },
    {
      "title": "Proposal IMK",
      "course": "Informatika Untuk Masyarakat",
      "deadline": "27 Mei 2026",
    },
    {
      "title": "Tugas Pemrograman",
      "course": "Aplikasi Berbasis Platform",
      "deadline": "29 Mei 2026",
    },
    {
      "title": "Presentasi Cloud",
      "course": "Cloud Computing",
      "deadline": "30 Mei 2026",
    },
    {
      "title": "Resume Jaringan",
      "course": "Jaringan Komputer",
      "deadline": "1 Juni 2026",
    },
    {
      "title": "Mini Project",
      "course": "Pembelajaran Mesin",
      "deadline": "3 Juni 2026",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Dashboard LMS",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Deadline Terdekat",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: priorityTasks.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: screenWidth > 700 ? 2.8 : 1.1,
                  ),

                  itemBuilder: (context, index) {
                    final task = priorityTasks[index];

                    return Container(
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: task["color"],
                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Icon(
                            Icons.assignment,
                            color: Colors.white,
                            size: 32,
                          ),

                          const Spacer(),

                          Text(
                            task["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            task["course"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "Deadline: ${task["deadline"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                const Text(
                  "Semua Tugas",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: taskList.length,

                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),

                  itemBuilder: (context, index) {
                    final task = taskList[index];

                    return Card(
                      elevation: 4,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: ListTile(
                        contentPadding: const EdgeInsets.all(14),

                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.red,

                          child: const Icon(Icons.book, color: Colors.white),
                        ),

                        title: Text(
                          task["title"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Mata Kuliah: ${task["course"]}"),

                              const SizedBox(height: 4),

                              Text("Deadline: ${task["deadline"]}"),

                              const SizedBox(height: 4),

                              const Text(
                                "Status: Belum Dikumpulkan",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),

                        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
