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
    <strong>Amelia Azmi</strong>
    <br>
    <strong>2311102135</strong>
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

## 1. ListView

ListView adalah widget di Flutter yang menampilkan daftar item secara berurutan, baik secara vertikal maupun horizontal. ListView lebih cocok digunakan ketika jumlah item bersifat dinamis atau dalam jumlah besar.

Terdapat beberapa varian ListView yang dapat digunakan sesuai kebutuhan. `ListView.builder` membuat item secara lazy, artinya hanya item yang tampil di layar yang dirender sehingga performa lebih optimal untuk daftar panjang. `ListView.separated` mirip dengan builder namun menambahkan pemisah antar item secara otomatis menggunakan parameter `separatorBuilder`, sehingga tampilan daftar lebih rapi dan terorganisir. Pada tugas ini, ListView digunakan untuk menampilkan delapan daftar tugas mata kuliah di bawah bagian grid.
---


## 2. Flutter

Flutter adalah framework open-source dari Google yang digunakan untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode. Flutter menggunakan bahasa pemrograman Dart dan mengandalkan konsep widget sebagai elemen dasar pembentuk antarmuka pengguna.

Dengan Flutter, proses pengembangan aplikasi lintas platform menjadi lebih efisien karena hanya membutuhkan satu kode untuk menghasilkan tampilan yang konsisten di berbagai perangkat. Flutter juga menyediakan banyak widget bawaan yang siap pakai dan dapat dikustomisasi.

---

## 3. Widget di Flutter

Dalam Flutter, segala sesuatu yang tampil di layar merupakan sebuah widget. Widget dapat berupa elemen visual seperti teks, tombol, atau gambar, maupun elemen layout seperti baris, kolom, dan padding.

Widget di Flutter terbagi menjadi dua jenis utama. StatelessWidget adalah widget yang tampilannya bersifat tetap dan tidak bergantung pada perubahan data. StatefulWidget adalah widget yang dapat berubah tampilannya menyesuaikan perubahan state atau data yang terjadi selama aplikasi berjalan.

---

## 4. GridView

GridView adalah widget di Flutter yang digunakan untuk menampilkan kumpulan item dalam susunan berbentuk grid atau kotak-kotak. GridView sangat berguna ketika ingin menampilkan konten secara dua dimensi, seperti galeri foto, daftar produk, atau kartu informasi.

Terdapat beberapa varian GridView yang umum digunakan. `GridView.count` memungkinkan penentuan jumlah kolom secara langsung menggunakan parameter `crossAxisCount`. `GridView.builder` digunakan untuk membuat grid secara dinamis dan lebih efisien dalam hal penggunaan memori karena hanya merender item yang terlihat di layar. Pada tugas ini, GridView digunakan untuk menampilkan dua kartu tugas teratas yang paling mendekati deadline, sehingga mahasiswa langsung dapat melihat prioritas tugas utama mereka.



---

# Studi Kasus

Amelia adalah mahasiswi Fakultas Informatika Universitas Telkom Purwokerto yang sering kesulitan memantau deadline tugas dari berbagai mata kuliah sekaligus. Untuk mempermudah pengelolaan tugas, Amelia diminta membuat tampilan mirip LMS (Learning Management System) kampus menggunakan Flutter.

Tampilan tersebut menampilkan dua kartu tugas paling dekat deadlinenya di bagian atas menggunakan GridView, dan di bawahnya menampilkan delapan daftar tugas lainnya menggunakan ListView.builder atau ListView.separated. Setiap item tugas menampilkan informasi lengkap berupa nama tugas, mata kuliah, deadline, dan status pengerjaan.

---

# Task 2 — Mobile Flutter: GridView & ListView

## Source Code Utama

### a. File Utama (`main.dart`)

```dart
import 'package:flutter/material.dart';
import 'lms_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const LmsScreen(),
    );
  }
}
```

---

### b. File Model (`task_model.dart`)

```dart
class TaskModel {
  final String taskName;
  final String subject;
  final String deadline;
  final String status;
  final String type;
  final int daysLeft;

  TaskModel({
    required this.taskName,
    required this.subject,
    required this.deadline,
    required this.status,
    required this.type,
    required this.daysLeft,
  });
}
```

---

### c. File Layar Utama (`lms_screen.dart`)

```dart
import 'package:flutter/material.dart';
import 'task_model.dart';

class LmsScreen extends StatelessWidget {
  const LmsScreen({super.key});

  // Data dummy semua tugas
  List<TaskModel> get allTasks => [
        TaskModel(
          taskName: 'Laporan Praktikum Laravel',
          subject: 'Aplikasi Berbasis Platform',
          deadline: '12 Mei 2026',
          status: 'Belum Dikerjakan',
          type: 'Laporan',
          daysLeft: 1,
        ),
        TaskModel(
          taskName: 'Quiz Bab 5 Jaringan',
          subject: 'Jaringan Komputer',
          deadline: '13 Mei 2026',
          status: 'Belum Dikerjakan',
          type: 'Quiz',
          daysLeft: 2,
        ),
        TaskModel(
          taskName: 'UTS Pemrograman Web',
          subject: 'Pemrograman Web',
          deadline: '15 Mei 2026',
          status: 'Sedang Dikerjakan',
          type: 'UTS',
          daysLeft: 4,
        ),
        TaskModel(
          taskName: 'Tugas Kalkulus Integral',
          subject: 'Kalkulus',
          deadline: '16 Mei 2026',
          status: 'Belum Dikerjakan',
          type: 'Tugas',
          daysLeft: 5,
        ),
        TaskModel(
          taskName: 'Presentasi Basis Data',
          subject: 'Basis Data',
          deadline: '17 Mei 2026',
          status: 'Belum Dikerjakan',
          type: 'Presentasi',
          daysLeft: 6,
        ),
        TaskModel(
          taskName: 'Resume Materi AI',
          subject: 'Kecerdasan Buatan',
          deadline: '18 Mei 2026',
          status: 'Sudah Dikerjakan',
          type: 'Resume',
          daysLeft: 7,
        ),
        TaskModel(
          taskName: 'Proyek Akhir Mobile',
          subject: 'Pemrograman Mobile',
          deadline: '20 Mei 2026',
          status: 'Sedang Dikerjakan',
          type: 'Proyek',
          daysLeft: 9,
        ),
        TaskModel(
          taskName: 'Laporan Algoritma',
          subject: 'Desain & Analisis Algoritma',
          deadline: '22 Mei 2026',
          status: 'Belum Dikerjakan',
          type: 'Laporan',
          daysLeft: 11,
        ),
      ];

  // 2 tugas terdekat untuk GridView
  List<TaskModel> get urgentTasks => allTasks.take(2).toList();

  // 8 tugas berikutnya untuk ListView
  List<TaskModel> get listTasks => allTasks.skip(2).take(8).toList();

  Color _statusColor(String status) {
    switch (status) {
      case 'Sudah Dikerjakan':
        return Colors.green;
      case 'Sedang Dikerjakan':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  Color _typeColor(String type) {
    switch (type) {
      case 'UTS':
      case 'Quiz':
        return const Color(0xFFE53935);
      case 'Proyek':
        return const Color(0xFF8E24AA);
      case 'Presentasi':
        return const Color(0xFF039BE5);
      default:
        return const Color(0xFF1A73E8);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A73E8),
        title: const Text(
          '📚 LMS Kampus',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'AA',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Selamat Datang
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A73E8), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Halo, Amelia! 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Kamu memiliki tugas yang mendekati deadline.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Judul Grid
            const Text(
              '🔥 Tugas Paling Dekat Deadline',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 10),

            // GRIDVIEW — 2 tugas terdekat
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: urgentTasks.map((task) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _typeColor(task.type).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            task.type,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: _typeColor(task.type),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          task.taskName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          task.subject,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 12, color: Colors.red),
                            const SizedBox(width: 4),
                            Text(
                              '${task.daysLeft} hari lagi',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Judul ListView
            const Text(
              '📋 Daftar Tugas Lainnya',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 10),

            // LISTVIEW.SEPARATED — 8 tugas berikutnya
            Expanded(
              child: ListView.separated(
                itemCount: listTasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final task = listTasks[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: CircleAvatar(
                        backgroundColor:
                            _typeColor(task.type).withOpacity(0.15),
                        child: Text(
                          task.type[0],
                          style: TextStyle(
                            color: _typeColor(task.type),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        task.taskName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            task.subject,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 11, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                'Deadline: ${task.deadline}',
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color:
                                  _statusColor(task.status).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              task.status,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: _statusColor(task.status),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${task.daysLeft} hari lagi',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
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
```

---

# Penjelasan Program

Program ini dibuat menggunakan framework Flutter dengan bahasa Dart, bertujuan menampilkan antarmuka mirip LMS (Learning Management System) kampus yang memudahkan mahasiswa memantau deadline tugas.

Pada bagian atas layar terdapat banner sambutan yang menampilkan nama pengguna. Di bawahnya, dua tugas dengan deadline paling dekat ditampilkan menggunakan `GridView.count` dengan dua kolom, sehingga kedua kartu tugas tersebut tampil berdampingan di kanan dan kiri. Setiap kartu menampilkan nama tugas, mata kuliah, tipe tugas, dan sisa hari menuju deadline.

Di bagian bawah grid, delapan tugas lainnya ditampilkan menggunakan `ListView.separated`, di mana setiap item dipisahkan oleh jarak antar kartu secara otomatis melalui `separatorBuilder`. Setiap item daftar menampilkan informasi lengkap berupa nama tugas, mata kuliah, deadline, status pengerjaan, dan sisa hari. Status pengerjaan diberi warna berbeda: merah untuk belum dikerjakan, oranye untuk sedang dikerjakan, dan hijau untuk sudah selesai.

Secara keseluruhan, aplikasi ini sudah mampu menampilkan data secara terstruktur menggunakan dua jenis widget layout utama Flutter yaitu GridView dan ListView, sesuai dengan ketentuan tugas yang diberikan.

---


# Output



---

<div align="center">
  <p>© 2026 Amelia Azmi — 2311102135 | S1 IF-11-REG05</p>
  <p>Universitas Telkom Purwokerto 💙</p>
</div>
