import 'package:flutter/material.dart';
//Rifqi Hemas P
//2311102302

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA), 
        fontFamily: 'Roboto', 
      ),
      home: const DashboardLMS(),
    );
  }
}

class DashboardLMS extends StatelessWidget {
  const DashboardLMS({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridTasks = [
      {
        'title': 'Tugas Flutter\nMobile',
        'course': 'Pemrograman Mobile',
        'date': '10 Mei 2026',
        'color': const Color(0xFFFF5252), 
        'icon': Icons.smartphone,
      },
      {
        'title': 'Laporan Big\nData',
        'course': 'Big Data',
        'date': '11 Mei 2026',
        'color': const Color(0xFFFF9800), 
        'icon': Icons.storage,
      },
    ];

    final List<Map<String, dynamic>> listTasks = [
      {
        'title': 'TUBES Web',
        'course': 'Pemrograman Web',
        'date': '15 Mei 2026',
        'extra': 'Deadline jam 23:59',
      },
      {
        'title': 'Quiz AI',
        'course': 'Artificial Intelligence',
        'date': '16 Mei 2026',
        'extra': 'Kerjakan di LMS',
      },
      {
        'title': 'Tugas Basis Data',
        'course': 'Sistem Basis Data',
        'date': '17 Mei 2026',
        'extra': 'Upload PDF',
      },
      {
        'title': 'Eksperimen Random Forest',
        'course': 'Machine Learning',
        'date': '18 Mei 2026',
        'extra': 'Lampirkan link Google Colab',
      },
      {
        'title': 'Setup Docker & Wazuh',
        'course': 'Keamanan Siber',
        'date': '19 Mei 2026',
        'extra': 'Screenshot dashboard agent',
      },
      {
        'title': 'Analisis Harga Saham',
        'course': 'Manajemen Keuangan',
        'date': '20 Mei 2026',
        'extra': 'Format Docx',
      },
      {
        'title': 'Laporan API Laravel',
        'course': 'Pemrograman Web Lanjut',
        'date': '21 Mei 2026',
        'extra': 'Push ke GitHub',
      },
      {
        'title': 'Mockup UI Aplikasi',
        'course': 'Desain UI/UX',
        'date': '22 Mei 2026',
        'extra': 'Kumpulkan link Figma',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard LMS',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFFF44336), 
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Deadline Terdekat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 16),
              
              GridView.builder(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(), 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85, 
                ),
                itemCount: gridTasks.length,
                itemBuilder: (context, index) {
                  final task = gridTasks[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: task['color'],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(task['icon'], color: Colors.white, size: 32),
                        const SizedBox(height: 16),
                        Text(
                          task['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          task['course'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Colors.white, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              task['date'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // --- SECTION 2: DAFTAR TUGAS ---
              const Text(
                'Daftar Tugas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 16),

              ListView.separated(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(), 
                itemCount: listTasks.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = listTasks[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEE), 
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.assignment,
                            color: Color(0xFFF44336), 
                          ),
                        ),
                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['course'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    item['date'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['extra'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF44336), 
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: const Text('Open'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}