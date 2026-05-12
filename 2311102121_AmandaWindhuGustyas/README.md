<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br> APLIKASI BERBASIS PLATFORM </h1>
  <br />
  <h3>MODUL 2 <br> Mobile Flutter </h3>
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

Kombinasi antara Column dan SingleChildScrollView sering digunakan untuk membuat halaman yang memiliki beberapa bagian konten sekaligus, seperti grid di bagian atas dan list di bagian bawah.
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
import 'home_page.dart';

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
        fontFamily: 'Segoe UI',
      ),
      home: const HomePage(),
    );
  }
}
```

---

### b. File `task_model.dart`

```dart
class Task {
  final String taskName;
  final String subject;
  final String deadline;
  final int daysLeft;
  final String status;
  final String priority;
  final String description;

  Task({
    required this.taskName,
    required this.subject,
    required this.deadline,
    required this.daysLeft,
    required this.status,
    required this.priority,
    required this.description,
  });
}

// Data dummy tugas
final List<Task> allTasks = [
  Task(
    taskName: 'Laporan Modul 14',
    subject: 'Aplikasi Berbasis Platform',
    deadline: '12 Mei 2026',
    daysLeft: 1,
    status: 'Belum Dikerjakan',
    priority: 'Tinggi',
    description: 'Buat laporan praktikum Flutter GridView & ListView',
  ),
  Task(
    taskName: 'Quiz Chapter 5',
    subject: 'Pemrograman Berorientasi Objek',
    deadline: '13 Mei 2026',
    daysLeft: 2,
    status: 'Sedang Dikerjakan',
    priority: 'Tinggi',
    description: 'Quiz materi inheritance dan polymorphism',
  ),
  Task(
    taskName: 'Tugas Analisis Algoritma',
    subject: 'Analisis Algoritma',
    deadline: '15 Mei 2026',
    daysLeft: 4,
    status: 'Belum Dikerjakan',
    priority: 'Sedang',
    description: 'Analisis kompleksitas algoritma sorting',
  ),
  Task(
    taskName: 'Presentasi UX Design',
    subject: 'Desain Pengalaman Pengguna',
    deadline: '16 Mei 2026',
    daysLeft: 5,
    status: 'Sedang Dikerjakan',
    priority: 'Sedang',
    description: 'Presentasi hasil prototype aplikasi mobile',
  ),
  Task(
    taskName: 'Laporan Praktikum Jaringan',
    subject: 'Jaringan Komputer',
    deadline: '17 Mei 2026',
    daysLeft: 6,
    status: 'Belum Dikerjakan',
    priority: 'Sedang',
    description: 'Laporan konfigurasi VLAN dan routing',
  ),
  Task(
    taskName: 'Mini Project Database',
    subject: 'Sistem Basis Data',
    deadline: '18 Mei 2026',
    daysLeft: 7,
    status: 'Belum Dikerjakan',
    priority: 'Tinggi',
    description: 'Buat skema database toko online lengkap',
  ),
  Task(
    taskName: 'Resume Paper AI',
    subject: 'Kecerdasan Buatan',
    deadline: '19 Mei 2026',
    daysLeft: 8,
    status: 'Selesai',
    priority: 'Rendah',
    description: 'Resume paper tentang machine learning terbaru',
  ),
  Task(
    taskName: 'Ujian Tengah Semester',
    subject: 'Matematika Diskrit',
    deadline: '20 Mei 2026',
    daysLeft: 9,
    status: 'Belum Dikerjakan',
    priority: 'Tinggi',
    description: 'UTS materi graf, pohon, dan kombinatorika',
  ),
  Task(
    taskName: 'Studi Kasus Keamanan Sistem',
    subject: 'Keamanan Sistem Informasi',
    deadline: '21 Mei 2026',
    daysLeft: 10,
    status: 'Belum Dikerjakan',
    priority: 'Sedang',
    description: 'Analisis kasus serangan SQL Injection',
  ),
  Task(
    taskName: 'Proyek Akhir Semester',
    subject: 'Rekayasa Perangkat Lunak',
    deadline: '30 Mei 2026',
    daysLeft: 19,
    status: 'Sedang Dikerjakan',
    priority: 'Tinggi',
    description: 'Pengembangan aplikasi manajemen tugas kampus',
  ),
];

// 2 tugas dengan deadline terdekat (untuk GridView)
List<Task> get urgentTasks => allTasks
    .where((t) => t.status != 'Selesai')
    .toList()
  ..sort((a, b) => a.daysLeft.compareTo(b.daysLeft))
  ..sublist(0, 2);

// 8 tugas berikutnya (untuk ListView, di luar 2 urgent)
List<Task> get listTasks {
  final urgent = urgentTasks;
  final rest = allTasks.where((t) => !urgent.contains(t)).toList();
  return rest.take(8).toList();
}
```

---

### c. File `home_page.dart`

```dart
import 'package:flutter/material.dart';
import 'task_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Color _priorityColor(String priority) {
    switch (priority) {
      case 'Tinggi':
        return const Color(0xFFD32F2F);
      case 'Sedang':
        return const Color(0xFFF57C00);
      default:
        return const Color(0xFF388E3C);
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Selesai':
        return const Color(0xFF388E3C);
      case 'Sedang Dikerjakan':
        return const Color(0xFF1A73E8);
      default:
        return const Color(0xFF757575);
    }
  }

  @override
  Widget build(BuildContext context) {
    final urgent = urgentTasks;
    final listed = listTasks;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A73E8),
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LMS Kampus',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Halo, Naya 👋',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── SECTION: DEADLINE TERDEKAT ──
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD32F2F),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '🔥 Deadline Terdekat',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // ── GRIDVIEW 2 KOLOM ──
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: urgent.map((task) => _buildUrgentCard(task)).toList(),
            ),

            const SizedBox(height: 24),

            // ── SECTION: SEMUA TUGAS ──
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A73E8),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '📋 Daftar Tugas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${listed.length} tugas',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // ── LISTVIEW.SEPARATED ──
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listed.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final task = listed[index];
                return _buildTaskListItem(task, index);
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ── WIDGET: CARD GRID (URGENT) ──
  Widget _buildUrgentCard(Task task) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: task.daysLeft <= 1
              ? [const Color(0xFFD32F2F), const Color(0xFFFF5252)]
              : [const Color(0xFFF57C00), const Color(0xFFFFB74D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (task.daysLeft <= 1
                    ? const Color(0xFFD32F2F)
                    : const Color(0xFFF57C00))
                .withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '⏰ ${task.daysLeft} hari lagi',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            task.taskName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            task.subject,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 11,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.white70, size: 12),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  task.deadline,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── WIDGET: ITEM LISTVIEW ──
  Widget _buildTaskListItem(Task task, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nomor urut
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF1A73E8).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Color(0xFF1A73E8),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Konten tugas
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama tugas
                  Text(
                    task.taskName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Mata kuliah
                  Row(
                    children: [
                      const Icon(Icons.school_outlined,
                          size: 13, color: Color(0xFF757575)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          task.subject,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF757575),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Deskripsi
                  Text(
                    task.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Baris bawah: deadline + status + prioritas
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      // Deadline
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.access_time,
                              size: 12, color: Color(0xFF9E9E9E)),
                          const SizedBox(width: 3),
                          Text(
                            task.deadline,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                        ],
                      ),

                      // Status
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: _statusColor(task.status).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color:
                                _statusColor(task.status).withOpacity(0.4),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          task.status,
                          style: TextStyle(
                            fontSize: 10,
                            color: _statusColor(task.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // Prioritas
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color:
                              _priorityColor(task.priority).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _priorityColor(task.priority)
                                .withOpacity(0.4),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          '🚩 ${task.priority}',
                          style: TextStyle(
                            fontSize: 10,
                            color: _priorityColor(task.priority),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Sisa hari (kanan)
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: task.daysLeft <= 3
                        ? const Color(0xFFD32F2F).withOpacity(0.1)
                        : const Color(0xFF1A73E8).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${task.daysLeft}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: task.daysLeft <= 3
                              ? const Color(0xFFD32F2F)
                              : const Color(0xFF1A73E8),
                        ),
                      ),
                      Text(
                        'hari',
                        style: TextStyle(
                          fontSize: 10,
                          color: task.daysLeft <= 3
                              ? const Color(0xFFD32F2F)
                              : const Color(0xFF1A73E8),
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
