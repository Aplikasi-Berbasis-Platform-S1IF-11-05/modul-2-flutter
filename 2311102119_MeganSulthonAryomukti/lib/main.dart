import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> tugasTerdekat = [
    {
      "judul": "Tugas Machine Learning",
      "matkul": "Machine Learning",
      "deadline": "14 Mei 2026",
    },
    {
      "judul": "Quiz Mobile",
      "matkul": "Pemrograman Mobile",
      "deadline": "15 Mei 2026",
    },
  ];

  final List<Map<String, String>> daftarTugas = [
    {
      "judul": "Laporan AI",
      "matkul": "Kecerdasan Artifisial",
      "deadline": "16 Mei 2026",
      "status": "Belum Dikumpul",
    },
    {
      "judul": "Tugas Basis Data",
      "matkul": "Basis Data",
      "deadline": "17 Mei 2026",
      "status": "Proses",
    },
    {
      "judul": "Quiz Web",
      "matkul": "Pemrograman Web",
      "deadline": "18 Mei 2026",
      "status": "Belum Dikumpul",
    },
    {
      "judul": "Resume Jaringan",
      "matkul": "Jaringan Komputer",
      "deadline": "19 Mei 2026",
      "status": "Selesai",
    },
    {
      "judul": "Tugas Cloud",
      "matkul": "Cloud Computing",
      "deadline": "20 Mei 2026",
      "status": "Proses",
    },
    {
      "judul": "Project UI/UX",
      "matkul": "UI/UX",
      "deadline": "21 Mei 2026",
      "status": "Belum Dikumpul",
    },
    {
      "judul": "Tugas Python",
      "matkul": "Python",
      "deadline": "22 Mei 2026",
      "status": "Selesai",
    },
    {
      "judul": "Mini Project",
      "matkul": "Mobile Flutter",
      "deadline": "23 Mei 2026",
      "status": "Belum Dikumpul",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(title: Text("LMS Kampus"), backgroundColor: Colors.blue),

        body: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            children: [
              // GRIDVIEW
              SizedBox(
                height: 180,

                child: GridView.builder(
                  itemCount: tugasTerdekat.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),

                  itemBuilder: (context, index) {
                    var tugas = tugasTerdekat[index];

                    return Container(
                      padding: EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Icon(Icons.assignment, color: Colors.white, size: 35),

                          SizedBox(height: 10),

                          Text(
                            tugas['judul']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            tugas['matkul']!,
                            style: TextStyle(color: Colors.white70),
                          ),

                          Spacer(),

                          Text(
                            "Deadline:",
                            style: TextStyle(color: Colors.white70),
                          ),

                          Text(
                            tugas['deadline']!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Daftar Tugas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 10),

              // LISTVIEW
              Expanded(
                child: ListView.separated(
                  itemCount: daftarTugas.length,

                  separatorBuilder: (context, index) => SizedBox(height: 10),

                  itemBuilder: (context, index) {
                    var tugas = daftarTugas[index];

                    return Card(
                      elevation: 3,

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.book, color: Colors.white),
                        ),

                        title: Text(tugas['judul']!),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 5),

                            Text("Matkul: ${tugas['matkul']}"),

                            Text("Deadline: ${tugas['deadline']}"),

                            Text("Status: ${tugas['status']}"),
                          ],
                        ),

                        trailing: Icon(Icons.arrow_forward_ios),
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
