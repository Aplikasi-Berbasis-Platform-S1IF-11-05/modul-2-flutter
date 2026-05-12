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
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<Map<String, String>> tugasList = const [
    {
      "judul": "Laporan Praktikum",
      "matkul": "Aplikasi Berbasis Platform",
      "deadline": "15 Mei 2026",
      "dosen": "Pak Dedy Agung Prabowo"
    },
    {
      "judul": "Membuat Cashflow",
      "matkul": "Kewirausahaan",
      "deadline": "16 Mei 2026",
      "dosen": "Bu Nur Hikmah Laila"
    },
    {
      "judul": "Reccurent Neural Network (RNN)",
      "matkul": "Machine Learning",
      "deadline": "17 Mei 2026",
      "dosen": "Pak Muhammad Zidny Naf an"
    },
    {
      "judul": "UI Design",
      "matkul": "Desain Interaksi",
      "deadline": "18 Mei 2026",
      "dosen": "Bu Tenia Wahyuningrum"
    },
    {
      "judul": "Video Presentasi",
      "matkul": "VERIFIKASI DAN VALIDASI PERANGKAT LUNAK",
      "deadline": "19 Mei 2026",
      "dosen": "Pak MUHAMMAD LULU LATIF USMAN"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LMS Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // GRIDVIEW
            SizedBox(
              height: 180,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  tugasGrid(
                    "Tugas Flutter",
                    "Pemrograman Mobile",
                    "Deadline: 13 Mei",
                    Colors.orange,
                  ),
                  tugasGrid(
                    "Laporan Basis Data",
                    "Basis Data",
                    "Deadline: 14 Mei",
                    Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // LISTVIEW
            Expanded(
              child: ListView.separated(
                itemCount: tugasList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final tugas = tugasList[index];

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.assignment, color: Colors.blue),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tugas["judul"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(tugas["matkul"]!),
                              Text("Deadline: ${tugas["deadline"]}"),
                              Text("Dosen: ${tugas["dosen"]}"),
                            ],
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

  Widget tugasGrid(
      String judul, String matkul, String deadline, Color warna) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            judul,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            matkul,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            deadline,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}