<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br> APLIKASI BERBASIS PLATFORM </h1>
  <br />
  <h3>MODUL 2 <br> MOBILE FLUTTER </h3>
  <br />
  <img width="512" height="512" alt="telyu" src="https://github.com/user-attachments/assets/724a3291-bcf9-448d-a395-3886a8659d79" />
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Arsya Fathiha Rahman</strong>
    <br>
    <strong>2311102152</strong>
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

Flutter adalah framework open-source dari Google yang digunakan untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode (codebase). Flutter menggunakan bahasa pemrograman Dart dan menyediakan widget-widget siap pakai yang memungkinkan pembuatan antarmuka pengguna yang menarik dan responsif.

Keunggulan Flutter terletak pada sistem renderingnya yang tidak bergantung pada komponen bawaan platform, sehingga tampilan aplikasi konsisten di berbagai perangkat baik Android maupun iOS.

---

## 2. Widget di Flutter

Dalam Flutter, segala sesuatu adalah widget. Widget merupakan blok pembangun tampilan yang dapat berupa elemen visual seperti teks, gambar, atau tombol, maupun elemen struktural seperti baris, kolom, dan padding.

Widget di Flutter terbagi menjadi dua jenis utama. Pertama adalah StatelessWidget, yaitu widget yang tidak memiliki state dan tampilannya tidak berubah selama runtime. Kedua adalah StatefulWidget, yaitu widget yang memiliki state dan dapat memperbarui tampilannya secara dinamis ketika data berubah.

---

## 3. GridView

GridView adalah widget di Flutter yang digunakan untuk menampilkan kumpulan data dalam format grid atau tabel dengan baris dan kolom. Widget ini sangat berguna ketika ingin menampilkan konten secara terstruktur dalam beberapa kolom sekaligus.

Terdapat beberapa cara membuat GridView di Flutter, salah satunya menggunakan `GridView.builder` yang membangun item secara efisien hanya ketika item tersebut perlu ditampilkan di layar. Jumlah kolom diatur melalui properti `SliverGridDelegateWithFixedCrossAxisCount` yang menerima parameter `crossAxisCount` untuk menentukan berapa kolom yang diinginkan.

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 15,
    mainAxisSpacing: 15,
    childAspectRatio: 0.82,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Container(/* widget item */);
  },
)
```

---

## 4. ListView

ListView adalah widget Flutter yang menampilkan sekumpulan item secara berurutan dalam arah vertikal maupun horizontal. Penggunaan ListView sangat umum untuk menampilkan daftar data yang dinamis.

Terdapat beberapa varian ListView yang lebih direkomendasikan dibandingkan `ListView` biasa. Pertama, `ListView.builder` yang membangun item secara lazy (hanya item yang terlihat di layar yang dirender), cocok untuk daftar panjang yang tidak diketahui jumlahnya. Kedua, `ListView.separated` yang mirip dengan builder namun secara otomatis menyisipkan widget pemisah (separator) di antara setiap item, sehingga tidak perlu menambahkan widget pembatas secara manual.

```dart
// ListView.builder — efisien untuk daftar panjang
ListView.builder(
  itemCount: tasks.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(tasks[index]));
  },
)

// ListView.separated — otomatis sisipkan pemisah antar item
ListView.separated(
  itemCount: tasks.length,
  separatorBuilder: (context, index) => SizedBox(height: 14),
  itemBuilder: (context, index) {
    return Container(/* widget item */);
  },
)
```

Keduanya lebih disarankan dibandingkan `ListView` biasa karena lebih hemat memori dan performa, terutama saat jumlah item banyak.

---

## 5. Scaffold dan AppBar

Scaffold adalah widget dasar yang menyediakan struktur halaman standar pada aplikasi Flutter, mencakup area untuk AppBar di bagian atas, body sebagai konten utama, dan berbagai komponen lain seperti FloatingActionButton dan BottomNavigationBar.

AppBar adalah bilah navigasi yang berada di bagian atas halaman, biasanya berisi judul, ikon aksi, dan tombol navigasi balik. Penggunaan Scaffold dan AppBar bersama-sama membentuk kerangka tampilan yang konsisten dengan panduan desain Material Design dari Google.

---

# Studi Kasus

Aplikasi ini merupakan simulasi tampilan halaman dasbor LMS (Learning Management System) Telkom University berbasis mobile menggunakan Flutter. Dasbor menampilkan dua tugas dengan deadline terdekat dalam format grid dua kolom di bagian atas, serta delapan daftar tugas lainnya dalam format list di bawahnya.

Setiap item pada grid menampilkan judul tugas, nama mata kuliah, dan tenggat waktu, sedangkan setiap item pada list menampilkan informasi lengkap berupa nama tugas, mata kuliah, tanggal deadline, dan status pengerjaan. Tampilan dirancang menyerupai antarmuka LMS web kampus yang diimplementasikan ke dalam platform mobile.

---

# Tugas — Mobile Flutter (LMS Dashboard)

## Source Code Utama

### `main.dart`
```dart
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

            // LISTVIEW.SEPARATED
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
```

---

# Penjelasan Program

Aplikasi ini dibangun menggunakan Flutter dengan pendekatan StatelessWidget karena data yang ditampilkan bersifat statis dan tidak memerlukan pembaruan dinamis selama runtime.

Bagian atas halaman menampilkan header card bergradient merah yang berisi sambutan pengguna, diikuti oleh baris menu navigasi berisi empat ikon shortcut. Di bawahnya terdapat bagian **Deadline Terdekat** yang menggunakan `GridView.builder` dengan `crossAxisCount: 2` untuk menampilkan dua tugas paling mendekati deadline secara berdampingan dalam dua kolom. Setiap card grid menampilkan ikon, judul tugas, nama mata kuliah, dan badge tenggat waktu.

Bagian **Daftar Tugas** menggunakan `ListView.separated` yang membangun delapan item tugas secara efisien sekaligus menyisipkan jarak otomatis di antara setiap item melalui `separatorBuilder`. Setiap item list menampilkan informasi lengkap berupa nama tugas, mata kuliah, deadline, dan status pengerjaan yang diberi warna berbeda sesuai kondisinya.

Secara keseluruhan, penggunaan `GridView.builder` dan `ListView.separated` menjamin performa yang baik karena widget hanya dirender ketika diperlukan, sehingga aplikasi tetap ringan meskipun jumlah data bertambah.

---

# Cara Menjalankan Program

1. Pastikan Flutter SDK sudah terinstall di perangkat
2. Buka folder project Flutter di terminal
3. Jalankan perintah:
   ```
   flutter pub get
   flutter run
   ```
4. Pilih device atau emulator yang tersedia

---

# Output

Aplikasi menampilkan dasbor LMS, Bagian atas berisi header kartu merah bergradient dan menu navigasi, diikuti grid dua kolom untuk tugas deadline terdekat, serta daftar tugas lengkap di bawahnya.
1. Tampilan Mobile Android

   <img width="1598" height="899" alt="SS1_TampilanAndroid" src="https://github.com/user-attachments/assets/f4c8fa4d-f905-4264-9f2f-15579e6834fd" />

3. Tampilan Chrome
   <img width="1553" height="861" alt="SS2_TampilanChromeLMS" src="https://github.com/user-attachments/assets/047b5e73-1002-42a4-bda1-ee7d3a1e42c9" />





