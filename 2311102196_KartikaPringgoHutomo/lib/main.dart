import 'package:flutter/material.dart';
// Kartika Pringgo Hutomo 
// 2311102196
void main() {
  runApp(const MyApp());
}

// Model for Task
class Task {
  final String id;
  final String taskName;
  final String courseName;
  final String deadline;
  final String status;
  final String priority;

  Task({
    required this.id,
    required this.taskName,
    required this.courseName,
    required this.deadline,
    required this.status,
    required this.priority,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus LMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFCC0000)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Campus LMS'),
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
  // Urgent tasks (for GridView)
  final List<Task> urgentTasks = [
    Task(
      id: '1',
      taskName: 'Algoritma & Struktur Data',
      courseName: 'ASD',
      deadline: '12 May 2026',
      status: 'Urgent',
      priority: 'High',
    ),
    Task(
      id: '2',
      taskName: 'Mobile Development',
      courseName: 'Mobile Dev',
      deadline: '13 May 2026',
      status: 'Urgent',
      priority: 'High',
    ),
  ];

  // All tasks (for ListView)
  final List<Task> allTasks = [
    Task(
      id: '3',
      taskName: 'Database Design Project',
      courseName: 'Database Systems',
      deadline: '15 May 2026',
      status: 'In Progress',
      priority: 'Medium',
    ),
    Task(
      id: '4',
      taskName: 'Web Development Assignment',
      courseName: 'Web Dev',
      deadline: '16 May 2026',
      status: 'In Progress',
      priority: 'Medium',
    ),
    Task(
      id: '5',
      taskName: 'Network Configuration Lab',
      courseName: 'Networking',
      deadline: '18 May 2026',
      status: 'In Progress',
      priority: 'Low',
    ),
    Task(
      id: '6',
      taskName: 'UI/UX Design Mockup',
      courseName: 'Design',
      deadline: '20 May 2026',
      status: 'Not Started',
      priority: 'Medium',
    ),
    Task(
      id: '7',
      taskName: 'Python Data Analysis',
      courseName: 'Data Science',
      deadline: '22 May 2026',
      status: 'Not Started',
      priority: 'Low',
    ),
    Task(
      id: '8',
      taskName: 'Cloud Computing Setup',
      courseName: 'Cloud Systems',
      deadline: '24 May 2026',
      status: 'Not Started',
      priority: 'Low',
    ),
    Task(
      id: '9',
      taskName: 'Security Audit Report',
      courseName: 'Cybersecurity',
      deadline: '26 May 2026',
      status: 'Not Started',
      priority: 'High',
    ),
    Task(
      id: '10',
      taskName: 'Machine Learning Model',
      courseName: 'AI/ML',
      deadline: '28 May 2026',
      status: 'Not Started',
      priority: 'Medium',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC0000),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              color: const Color(0xFFCC0000),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tugas Mendekati Deadline',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // GridView for urgent tasks (2 columns)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                    itemCount: urgentTasks.length,
                    itemBuilder: (context, index) {
                      final task = urgentTasks[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFCC0000),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                task.priority,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              task.courseName,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              task.taskName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              task.deadline,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFFCC0000),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // All Tasks Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Semua Tugas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // ListView.separated for all tasks
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allTasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = allTasks[index];
                      return _buildTaskCard(task);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(Task task) {
    Color statusColor;
    IconData statusIcon;

    switch (task.status) {
      case 'Urgent':
        statusColor = const Color(0xFFCC0000);
        statusIcon = Icons.priority_high;
        break;
      case 'In Progress':
        statusColor = const Color(0xFFFFA500);
        statusIcon = Icons.hourglass_bottom;
        break;
      case 'Not Started':
        statusColor = const Color(0xFF808080);
        statusIcon = Icons.schedule;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.info;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with course and status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.courseName,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(statusIcon, size: 12, color: statusColor),
                    const SizedBox(width: 4),
                    Text(
                      task.status,
                      style: TextStyle(
                        fontSize: 11,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Task name
          Text(
            task.taskName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 10),
          // Footer with deadline
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 14,
                color: Color(0xFFCC0000),
              ),
              const SizedBox(width: 6),
              Text(
                'Deadline: ${task.deadline}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFCC0000),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
