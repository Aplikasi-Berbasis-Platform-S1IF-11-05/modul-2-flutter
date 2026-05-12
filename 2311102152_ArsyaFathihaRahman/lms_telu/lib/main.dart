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
      home: const LMSPage(),
    );
  }
}

class LMSPage extends StatelessWidget {
  const LMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> deadlineTask = [
      {
        "title": "Tugas 10.2b - Networking 2",
        "course": "Aplikasi Berbasis Platform",
        "deadline": "Hari Ini • 23:59",
        "color": const Color(0xffE91E63),
        "icon": Icons.insert_drive_file_outlined,
      },
      {
        "title": "Artefak TUBES 1 Web",
        "course": "Aplikasi Berbasis Platform",
        "deadline": "31 Mei 2026",
        "color": const Color(0xff5E35B1),
        "icon": Icons.language,
      },
    ];

    final List<Map<String, dynamic>> tasks = [
      {
        "title": "Implementasi Firebase",
        "course": "Mobile Computing",
        "date": "20 Mei 2026",
        "status": "Belum Upload",
        "color": Colors.red,
      },
      {
        "title": "Quiz Machine Learning",
        "course": "Artificial Intelligence",
        "date": "21 Mei 2026",
        "status": "Progress",
        "color": Colors.orange,
      },
      {
        "title": "Video Presentasi",
        "course": "UI UX Design",
        "date": "22 Mei 2026",
        "status": "Review",
        "color": Colors.blue,
      },
      {
        "title": "Resume Materi Cloud",
        "course": "Cloud Computing",
        "date": "23 Mei 2026",
        "status": "Belum Dikerjakan",
        "color": Colors.red,
      },
      {
        "title": "Prototype Figma",
        "course": "Human Computer Interaction",
        "date": "24 Mei 2026",
        "status": "Selesai",
        "color": Colors.green,
      },
      {
        "title": "Laporan Docker",
        "course": "DevOps",
        "date": "25 Mei 2026",
        "status": "Belum Upload",
        "color": Colors.red,
      },
      {
        "title": "Mini Quiz",
        "course": "Cyber Security",
        "date": "26 Mei 2026",
        "status": "Progress",
        "color": Colors.orange,
      },
      {
        "title": "Tugas API",
        "course": "Backend Programming",
        "date": "27 Mei 2026",
        "status": "Belum Mulai",
        "color": Colors.deepOrange,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffEEF2F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Dasbor LMS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Color(0xffC62828),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // HEADER CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffC62828),
                    Color(0xffE53935),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LMS Telkom University",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Welcome Back Student 👋",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      color: Color(0xffC62828),
                      size: 32,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // MENU
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menuItem(Icons.menu_book_rounded, "Course"),
                menuItem(Icons.assignment_outlined, "Task"),
                menuItem(Icons.calendar_month_outlined, "Schedule"),
                menuItem(Icons.grade_outlined, "Score"),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              "Deadline Terdekat",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // GRIDVIEW
            SizedBox(
              height: 230,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: deadlineTask.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) {
                  final item = deadlineTask[index];

                  return Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            item['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          item['course'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            item['deadline'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Daftar Tugas",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // LISTVIEW
            ListView.separated(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final item = tasks[index];

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(1, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: item['color'].withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.assignment,
                          color: item['color'],
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              item['course'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey,
                                ),

                                const SizedBox(width: 5),

                                Text(
                                  item['date'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: item['color'].withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          item['status'],
                          style: TextStyle(
                            color: item['color'],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(1, 3),
              )
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xffC62828),
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}


