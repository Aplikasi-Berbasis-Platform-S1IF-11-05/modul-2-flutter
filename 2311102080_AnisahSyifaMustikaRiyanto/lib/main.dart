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
    final List<Map<String, dynamic>> deadlineTasks = [
      {
        "title": "Modul 2 Flutter",
        "course": "Aplikasi Berbasis Platform",
        "deadline": "13 Mei 2026",
        "color": Colors.pink,
      },
      {
        "title": "Dokumentasi TUBES",
        "course": "Computing Project",
        "deadline": "17 Mei 2026",
        "color": Colors.orange,
      },
    ];

    final List<Map<String, dynamic>> tasks = [
      {
        "title": "Artefak TUBES 1 Web",
        "course": "Aplikasi Berbasis Platform",
        "deadline": "31 Mei 2026",
      },
      {
        "title": "Artefak TUBES 2 Mobile",
        "course": "Mobile Programming",
        "deadline": "7 Juni 2026",
      },
      {
        "title": "Dokumentasi TUBES",
        "course": "Computing Project",
        "deadline": "19 Juni 2026",
      },
      {
        "title": "Resume Jurnal AI",
        "course": "Artificial Intelligence",
        "deadline": "22 Juni 2026",
      },
      {
        "title": "Perancangan ERD",
        "course": "Basis Data",
        "deadline": "25 Juni 2026",
      },
      {
        "title": "Prototype UI Figma",
        "course": "UI UX",
        "deadline": "28 Juni 2026",
      },
      {
        "title": "Analisis UML",
        "course": "Rekayasa Perangkat Lunak",
        "deadline": "1 Juli 2026",
      },
      {
        "title": "Testing REST API",
        "course": "Backend Development",
        "deadline": "5 Juli 2026",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        elevation: 0,
        title: const Text(
          "Timeline LMS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Deadline Terdekat",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            /// GRIDVIEW
            SizedBox(
              height: 170,

              child: GridView.builder(
                itemCount: deadlineTasks.length,

                physics: const NeverScrollableScrollPhysics(),

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.5,
                ),

                itemBuilder: (context, index) {

                  final task = deadlineTasks[index];

                  return Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: task["color"],
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      mainAxisAlignment:
                      MainAxisAlignment.start,

                      children: [

                        Container(
                          padding: const EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius:
                            BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.assignment,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          task["title"],

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          task["course"],

                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Deadline: ${task["deadline"]}",

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
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

            const SizedBox(height: 15),

            /// LISTVIEW
            Expanded(
              child: ListView.separated(

                itemCount: tasks.length,

                separatorBuilder: (context, index) =>
                const SizedBox(height: 14),

                itemBuilder: (context, index) {

                  final task = tasks[index];

                  return Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(22),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [

                        Container(
                          width: 58,
                          height: 58,

                          decoration: BoxDecoration(
                            color: Colors.pink.shade200,
                            borderRadius:
                            BorderRadius.circular(18),
                          ),

                          child: const Icon(
                            Icons.description,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                task["title"],

                                style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                task["course"],

                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "Deadline: ${task["deadline"]}",

                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.pink.shade300,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(12),
                            ),
                          ),

                          onPressed: () {},

                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}