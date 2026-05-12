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
      title: 'LMS Telkom University',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    // DATA GRID (2 tugas terdekat deadline)
    final List<Map<String, dynamic>> priorityTasks = [
      {
        "title": "Tugas Flutter Mobile",
        "course": "Pemrograman Mobile",
        "deadline": "10 Mei 2026",
        "icon": Icons.phone_android,
        "color": Colors.redAccent,
      },
      {
        "title": "Laporan Big Data",
        "course": "Big Data",
        "deadline": "11 Mei 2026",
        "icon": Icons.storage,
        "color": Colors.orange,
      },
    ];

    // DATA LIST VIEW
    final List<Map<String, dynamic>> taskList = [
      {
        "title": "TUBES Web",
        "course": "Pemrograman Web",
        "deadline": "15 Mei 2026",
        "detail": "Deadline jam 23:59"
      },
      {
        "title": "Quiz AI",
        "course": "Artificial Intelligence",
        "deadline": "16 Mei 2026",
        "detail": "Kerjakan di LMS"
      },
      {
        "title": "Tugas Basis Data",
        "course": "Sistem Basis Data",
        "deadline": "17 Mei 2026",
        "detail": "Upload PDF"
      },
      {
        "title": "Tugas Machine Learning",
        "course": "Machine Learning",
        "deadline": "18 Mei 2026",
        "detail": "Individual"
      },
      {
        "title": "Laporan Jaringan",
        "course": "Networking",
        "deadline": "19 Mei 2026",
        "detail": "Format DOCX"
      },
      {
        "title": "Project UI UX",
        "course": "UI UX Design",
        "deadline": "20 Mei 2026",
        "detail": "Upload Figma"
      },
      {
        "title": "Tugas Cloud",
        "course": "Cloud Computing",
        "deadline": "21 Mei 2026",
        "detail": "Buat deployment"
      },
      {
        "title": "Resume Seminar",
        "course": "Seminar IT",
        "deadline": "22 Mei 2026",
        "detail": "Minimal 2 halaman"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Dashboard LMS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // PAKAI LISTVIEW BUILDER
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // HEADER
          const Text(
            "Deadline Terdekat",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // GRID VIEW
          SizedBox(
            height: 220,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: priorityTasks.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
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
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        task["icon"],
                        size: 40,
                        color: Colors.white,
                      ),

                      Text(
                        task["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        task["course"],
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            task["deadline"],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Daftar Tugas",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // LIST VIEW BUILDER
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: taskList.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final task = taskList[index];

              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [

                    // ICON
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.assignment,
                        color: Colors.red,
                      ),
                    ),

                    const SizedBox(width: 15),

                    // TEXT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task["title"],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            task["course"],
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 16,
                                color: Colors.grey,
                              ),

                              const SizedBox(width: 5),

                              Text(
                                task["deadline"],
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          Text(
                            task["detail"],
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // BUTTON
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Open",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

