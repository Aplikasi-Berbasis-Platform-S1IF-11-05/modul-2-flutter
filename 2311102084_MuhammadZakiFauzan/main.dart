import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Kampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LMSHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LMSHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8FAFF),
              Color(0xFFEFF6FF),
              Color(0xFFF0F9FF),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeroHeader(),
                SizedBox(height: 24),
                UrgentTasksGrid(),
                SizedBox(height: 28),
                AllTasksList(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeroHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF667EEA).withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white70],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.person,
              size: 32,
              color: Color(0xFF667EEA),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Muhammad Zaki Fauzan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '2311102084',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Icon(Icons.notifications_none, color: Colors.white, size: 24),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UrgentTasksGrid extends StatelessWidget {
  final List<Color> urgentColors = [
    Color(0xFFFF6B6B),
    Color(0xFFFFA726),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🚨 Tugas Mendesak',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3436),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFE17055),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '2 Tugas',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 220,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.82,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return UrgentTaskCard(
                  index: index,
                  color: urgentColors[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UrgentTaskCard extends StatelessWidget {
  final int index;
  final Color color;

  const UrgentTaskCard({Key? key, required this.index, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer_off,
                    size: 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6),
                  Text(
                    index == 0 ? '2h 15m' : '1d 3h',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              index == 0 ? 'Algoritma & Struktur Data' : 'Database Management',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3436),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6),
            Text(
              index == 0
                  ? 'Implementasi Graph Traversal (DFS/BFS)'
                  : 'Normalisasi Database + Stored Procedure',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF636E72),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.radio_button_unchecked,
                    size: 16,
                    color: Color(0xFFE84393)),
                SizedBox(width: 6),
                Text(
                  'Belum diserahkan',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFE84393),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AllTasksList extends StatelessWidget {
  final List<Color> taskColors = [
    Color(0xFF00B894),
    Color(0xFFFDCB6E),
    Color(0xFF55A3FF),
    Color(0xFF778BDD),
    Color(0xFFFF7675),
    Color(0xFFFD79A8),
    Color(0xFF6C5CE7),
    Color(0xFF74B9FF),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '📚 Semua Tugas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3436),
                ),
              ),
              Text(
                '8 Tugas',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF636E72),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 520,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                return TaskListItem(
                  index: index,
                  color: taskColors[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TaskListItem extends StatelessWidget {
  final int index;
  final Color color;

  const TaskListItem({Key? key, required this.index, required this.color})
      : super(key: key);

  String getTaskName(int index) {
    List<String> tasks = [
      'Landing Page Responsive + PWA',
      'Process Scheduling Simulator',
      'TCP/IP 3-Way Handshake Demo',
      'Neural Network Implementation',
      'Complete UML Diagrams + ERD',
      'AES Encryption Implementation',
      'Hadoop MapReduce Pipeline',
      'Flutter State Management App'
    ];
    return tasks[index];
  }

  String getCourse(int index) {
    List<String> courses = [
      'Web Programming',
      'Operating Systems',
      'Computer Networks',
      'Artificial Intelligence',
      'Software Engineering',
      'Cyber Security',
      'Big Data Analytics',
      'Mobile Development'
    ];
    return courses[index];
  }

  String getDeadline(int index) {
    List<String> deadlines = [
      '15 Des • 23:59',
      '18 Des • 23:59',
      '20 Des • 09:00',
      '22 Des • 23:59',
      '25 Des • 23:59',
      '28 Des • 23:59',
      '30 Des • 23:59',
      '05 Jan • 23:59'
    ];
    return deadlines[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              _getTaskIcon(index),
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTaskName(index),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  getCourse(index),
                  style: TextStyle(
                    fontSize: 14,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 16,
                        color: Color(0xFF636E72)),
                    SizedBox(width: 6),
                    Text(
                      getDeadline(index),
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF636E72),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color.withOpacity(0.2), color.withOpacity(0.1)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: color.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '${(index + 1) * 10 + 20}%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTaskIcon(int index) {
    List<IconData> icons = [
      Icons.web,
      Icons.speed,
      Icons.wifi,
      Icons.smart_toy,
      Icons.design_services,
      Icons.security,
      Icons.analytics,
      Icons.phone_android,
    ];
    return icons[index];
  }
}