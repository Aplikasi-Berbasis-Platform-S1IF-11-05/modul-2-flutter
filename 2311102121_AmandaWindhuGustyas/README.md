<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br> APLIKASI BERBASIS PLATFORM </h1>
  <br />
  <h3>MODUL 2 <br> Mobile Flutter</h3>
  <br />
  <img width="512" height="512" alt="telyu" src="https://github.com/user-attachments/assets/724a3291-bcf9-448d-a395-3886a8659d79" />
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Amanda Windhu Gustyas</strong>
    <br>
    <strong>2311102121</strong>
    <br>
    <strong>S1 IF-11-REG05</strong>
  </p>
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Dedi Agung Prabowo, S.Kom., M.Kom</strong>
  </p>
  <br />
  <br />
  <h4>Asisten Praktikum :</h4>
  <strong>Apri Pandu Wicaksono</strong>
  <br>
  <strong>Hamka Zaenul Ardi</strong>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026 </h3>
</div>

<hr>

---

# Dasar Teori

## 1. Flutter

Flutter adalah framework open-source buatan Google yang digunakan untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode (codebase). Flutter menggunakan bahasa pemrograman Dart dan menyediakan banyak widget bawaan yang mempermudah proses pembuatan antarmuka pengguna (UI).

Salah satu keunggulan Flutter adalah kemampuannya untuk merender tampilan secara langsung tanpa bergantung pada komponen native, sehingga tampilan antar platform menjadi konsisten. Flutter juga mendukung hot reload yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa harus menjalankan ulang aplikasi.

---
## 2. Column dan SingleChildScrollView

Column adalah widget tata letak yang menyusun anak-anaknya secara vertikal. Ketika konten di dalam Column melebihi tinggi layar, maka perlu dibungkus dengan SingleChildScrollView agar konten dapat di-scroll oleh pengguna.

---


## 3. Widget di Flutter

Pada Flutter, semua elemen tampilan disebut sebagai widget. Terdapat dua jenis widget utama, yaitu StatelessWidget dan StatefulWidget.

StatelessWidget digunakan untuk komponen yang tidak berubah setelah dibuat, sedangkan StatefulWidget digunakan untuk komponen yang memiliki state dan dapat berubah selama aplikasi berjalan. Setiap widget dapat bersarang di dalam widget lain, membentuk sebuah widget tree yang menjadi dasar rendering tampilan Flutter.

---

## 4. GridView

GridView adalah widget di Flutter yang digunakan untuk menampilkan daftar item dalam format kotak-kotak (grid) dengan baris dan kolom. Widget ini sangat berguna ketika ingin menampilkan konten secara terstruktur, seperti daftar tugas, galeri foto, atau produk.

Terdapat beberapa konstruktor yang dapat digunakan pada GridView, antara lain:

- **GridView.count** — digunakan ketika jumlah kolom sudah diketahui secara pasti dengan parameter `crossAxisCount`.
- **GridView.builder** — digunakan untuk membuat grid secara dinamis dan efisien karena hanya merender item yang terlihat di layar.
- **GridView.extent** — digunakan ketika ukuran maksimum setiap item sudah ditentukan.

Parameter penting pada GridView antara lain `crossAxisCount` untuk menentukan jumlah kolom, `crossAxisSpacing` dan `mainAxisSpacing` untuk mengatur jarak antar item, serta `childAspectRatio` untuk menentukan rasio lebar dan tinggi setiap item.

---

# Soal:

Aplikasi ini merupakan simulasi tampilan LMS (Learning Management System) kampus berbasis mobile. Pada halaman utama, terdapat dua bagian utama. Bagian pertama adalah GridView dua kolom yang menampilkan dua tugas dengan deadline paling dekat, dilengkapi informasi nama tugas, mata kuliah, dan sisa hari. Bagian kedua adalah ListView yang menampilkan 8 tugas lainnya secara berurutan, masing-masing berisi nama tugas, mata kuliah, deadline, status pengerjaan, dan prioritas tugas.

Aplikasi ini dibuat menggunakan Flutter dengan memanfaatkan GridView dan ListView.builder/separated sesuai ketentuan praktikum.

---

# Tugas 2 — Mobile Flutter 

## Source Code Utama

### a. File `main.dart`

```dart
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


```

---

#  Penjelasan Program

Program ini dibuat menggunakan Flutter dengan tampilan yang menyerupai LMS kampus. Terdapat dua bagian utama pada halaman utama.

Bagian pertama menggunakan GridView.count dengan dua kolom untuk menampilkan dua tugas yang memiliki deadline paling dekat. Setiap kartu grid menampilkan nama tugas, mata kuliah, deadline, dan sisa hari pengerjaan. Kartu bergradasi merah digunakan untuk tugas yang sangat mendesak, sedangkan kartu bergradasi oranye untuk tugas yang mendekati deadline.

Bagian kedua menggunakan ListView.separated untuk menampilkan delapan tugas berikutnya di luar dua tugas urgent tersebut. Setiap item menampilkan nomor urut, nama tugas, mata kuliah, deskripsi singkat, deadline, status pengerjaan, dan prioritas tugas. Pemisah antar item menggunakan SizedBox sehingga tampilan tetap bersih dan rapi.

Data tugas dikelola melalui model Task yang terpisah pada file task_model.dart. Logika penyortiran deadline dan pengambilan data dilakukan menggunakan getter urgentTasks dan listTasks. Keseluruhan halaman dibungkus dengan SingleChildScrollView agar dapat di-scroll ketika konten melebihi tinggi layar.

---


# Output
<img width="1397" height="886" alt="Screenshoot1" src="https://github.com/user-attachments/assets/2db3d92b-4b35-4537-b99e-107c2e3f2697" />


