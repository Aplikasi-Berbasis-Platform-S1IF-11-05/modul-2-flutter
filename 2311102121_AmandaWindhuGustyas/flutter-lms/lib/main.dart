import 'package:flutter/material.dart';

void main() {
  runApp(const TelULmsApp());
}

class TelULmsApp extends StatelessWidget {
  const TelULmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Tel-U LMS",
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // GRIDVIEW DATA
    final List<Map<String, dynamic>> deadlineUtama = [
      {
        "matkul": "Computer Vision",
        "tugas": "Deteksi Objek YOLO",
        "jam": "23:59",
        "warna": const Color(0xff6C63FF),
        "icon": Icons.remove_red_eye,
      },
      {
        "matkul": "Enterprise System",
        "tugas": "Analisis ERP",
        "jam": "20:00",
        "warna": const Color(0xff00B894),
        "icon": Icons.business_center,
      },
    ];

    // LISTVIEW DATA
    final List<Map<String, dynamic>> semuaTugas = [
      {
        "nama": "Resume Materi",
        "matkul": "Blockchain",
        "deadline": "13 Mei 2026",
        "status": "Belum Dikumpulkan"
      },
      {
        "nama": "Prototype Mobile",
        "matkul": "Human Computer Interaction",
        "deadline": "14 Mei 2026",
        "status": "On Progress"
      },
      {
        "nama": "Tugas Clustering",
        "matkul": "Data Science",
        "deadline": "15 Mei 2026",
        "status": "Belum Mulai"
      },
      {
        "nama": "Video Presentasi",
        "matkul": "Digital Business",
        "deadline": "16 Mei 2026",
        "status": "Sudah Upload"
      },
      {
        "nama": "Laporan Docker",
        "matkul": "Cloud Infrastructure",
        "deadline": "17 Mei 2026",
        "status": "On Review"
      },
      {
        "nama": "Mini Quiz",
        "matkul": "Cyber Security",
        "deadline": "18 Mei 2026",
        "status": "Belum Dikerjakan"
      },
      {
        "nama": "Design Thinking",
        "matkul": "Startup Technology",
        "deadline": "19 Mei 2026",
        "status": "In Progress"
      },
      {
        "nama": "API Testing",
        "matkul": "Software Quality Assurance",
        "deadline": "20 Mei 2026",
        "status": "Belum Upload"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffEEF2F7),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "My Courses",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "LMS Telkom University",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.red.shade200,
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // TITLE
              const Text(
                "Urgent Assignment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // GRIDVIEW BUILDER
              SizedBox(
                height: 190,
                child: GridView.builder(
                  itemCount: deadlineUtama.length,
                  physics: const NeverScrollableScrollPhysics(),

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.95,
                  ),

                  itemBuilder: (context, index) {

                    final data = deadlineUtama[index];

                    return Container(
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: data["warna"],
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              data["icon"],
                              color: Colors.white,
                              size: 35,
                            ),
                          ),

                          Text(
                            data["matkul"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          Text(
                            data["tugas"],
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 16,
                                ),

                                const SizedBox(width: 5),

                                Text(
                                  data["jam"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
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
                "Upcoming Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // LISTVIEW BUILDER
              Expanded(
                child: ListView.separated(

                  itemCount: semuaTugas.length,

                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),

                  itemBuilder: (context, index) {

                    final tugas = semuaTugas[index];

                    return Container(
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [

                              Container(
                                padding:
                                    const EdgeInsets.all(10),

                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),

                                child: Icon(
                                  Icons.folder_copy,
                                  color: Colors.blue.shade700,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      tugas["nama"],
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      tugas["matkul"],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,

                            children: [

                              Row(
                                children: [

                                  const Icon(
                                    Icons.date_range,
                                    size: 18,
                                    color: Colors.grey,
                                  ),

                                  const SizedBox(width: 5),

                                  Text(
                                    tugas["deadline"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius:
                                      BorderRadius.circular(20),
                                ),

                                child: Text(
                                  tugas["status"],
                                  style: TextStyle(
                                    color:
                                        Colors.orange.shade900,
                                    fontWeight:
                                        FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}

