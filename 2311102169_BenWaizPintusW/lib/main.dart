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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> urgentTasks = const [
    {
      'title': 'Tugas Flutter',
      'course': 'Mobile Programming',
      'deadline': '12 Mei 2026',
      'time': '2 Jam Lagi',
      'color': Colors.red,
    },
    {
      'title': 'Laporan AI',
      'course': 'Artificial Intelligence',
      'deadline': '13 Mei 2026',
      'time': '1 Hari Lagi',
      'color': Colors.orange,
    },
  ];

  final List<Map<String, String>> taskList = const [
    {
      'title': 'Quiz Basis Data',
      'course': 'Basis Data',
      'deadline': '15 Mei 2026',
      'room': 'Lab 2',
    },
    {
      'title': 'Makalah Jaringan',
      'course': 'Jaringan Komputer',
      'deadline': '16 Mei 2026',
      'room': 'Ruang A1',
    },
    {
      'title': 'UI Design',
      'course': 'IMK',
      'deadline': '17 Mei 2026',
      'room': 'Online',
    },
    {
      'title': 'Mini Project',
      'course': 'Pemrograman Web',
      'deadline': '18 Mei 2026',
      'room': 'Lab Web',
    },
    {
      'title': 'Resume Video',
      'course': 'Multimedia',
      'deadline': '19 Mei 2026',
      'room': 'Ruang B2',
    },
    {
      'title': 'Analisis Jurnal',
      'course': 'Metopen',
      'deadline': '20 Mei 2026',
      'room': 'Online',
    },
    {
      'title': 'ERD Sistem',
      'course': 'SI',
      'deadline': '21 Mei 2026',
      'room': 'Lab 3',
    },
    {
      'title': 'Kriptografi',
      'course': 'Keamanan Data',
      'deadline': '22 Mei 2026',
      'room': 'Ruang C1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 380;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'LMS Kampus',
          style: TextStyle(
            fontSize: isSmall ? 18 : 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isSmall ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deadline Terdekat',
              style: TextStyle(
                fontSize: isSmall ? 18 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: isSmall ? 10 : 16),

            SizedBox(
              height: isSmall ? 170 : 200,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: urgentTasks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: isSmall ? 8 : 12,
                  mainAxisSpacing: isSmall ? 8 : 12,
                  childAspectRatio: isSmall ? 0.85 : 1,
                ),
                itemBuilder: (context, index) {
                  final task = urgentTasks[index];

                  return Container(
                    padding: EdgeInsets.all(isSmall ? 10 : 14),
                    decoration: BoxDecoration(
                      color: task['color'],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task['course'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isSmall ? 10 : 12,
                          ),
                        ),

                        SizedBox(height: isSmall ? 8 : 12),

                        Text(
                          task['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmall ? 14 : 18,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          task['deadline'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmall ? 10 : 12,
                          ),
                        ),

                        SizedBox(height: isSmall ? 6 : 8),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmall ? 8 : 10,
                            vertical: isSmall ? 4 : 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            task['time'],
                            style: TextStyle(
                              color: task['color'],
                              fontWeight: FontWeight.bold,
                              fontSize: isSmall ? 10 : 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: isSmall ? 12 : 20),

            Text(
              'Daftar Tugas',
              style: TextStyle(
                fontSize: isSmall ? 18 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: isSmall ? 10 : 16),

            Expanded(
              child: ListView.separated(
                itemCount: taskList.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: isSmall ? 8 : 12),
                itemBuilder: (context, index) {
                  final task = taskList[index];

                  return Container(
                    padding: EdgeInsets.all(isSmall ? 10 : 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black12,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: isSmall ? 18 : 22,
                          backgroundColor: Colors.blue,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmall ? 12 : 14,
                            ),
                          ),
                        ),

                        SizedBox(width: isSmall ? 10 : 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task['title']!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isSmall ? 13 : 16,
                                ),
                              ),

                              SizedBox(height: isSmall ? 4 : 6),

                              Text(
                                'Matkul : ${task['course']}',
                                style: TextStyle(
                                  fontSize: isSmall ? 11 : 13,
                                  color: Colors.black87,
                                ),
                              ),

                              Text(
                                'Deadline : ${task['deadline']}',
                                style: TextStyle(
                                  fontSize: isSmall ? 11 : 13,
                                  color: Colors.black87,
                                ),
                              ),

                              Text(
                                'Ruangan : ${task['room']}',
                                style: TextStyle(
                                  fontSize: isSmall ? 11 : 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: isSmall ? 14 : 18,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}