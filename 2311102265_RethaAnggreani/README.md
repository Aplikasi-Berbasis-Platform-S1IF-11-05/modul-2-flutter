<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br> APLIKASI BERBASIS PLATFORM </h1>
  <br />
  <h3>MODUL 2 <br> FLUTTER </h3>
  <br />
  <img width="512" height="512" alt="telyu" src="https://github.com/user-attachments/assets/724a3291-bcf9-448d-a395-3886a8659d79" />
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Retha Anggreani</strong>
    <br>
    <strong>2311102265</strong>
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
  <strong>Apri Pandu Wicaksono </strong>
  <br>
  <strong>Hamka Zaenul Ardi</strong>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026 </h3>
</div>

<hr>

## Dasar Teori

## 1. Pengertian Flutter

Flutter adalah framework open-source yang dikembangkan oleh Google untuk membangun aplikasi multiplatform seperti Android, iOS, web, dan desktop menggunakan satu basis kode. Flutter menggunakan bahasa pemrograman Dart dan menerapkan konsep widget sebagai dasar penyusunan antarmuka pengguna (User Interface/UI).

Dalam Flutter, tampilan aplikasi dibangun menggunakan berbagai jenis widget, termasuk widget untuk menampilkan kumpulan data seperti ListView dan GridView.

## 2. Teori Dasar ListView

ListView merupakan widget yang digunakan untuk menampilkan sekumpulan data dalam bentuk daftar yang dapat di-scroll. Widget ini sangat berguna ketika aplikasi membutuhkan tampilan data secara berurutan dari atas ke bawah atau dari kiri ke kanan.

ListView banyak digunakan dalam pengembangan aplikasi mobile karena mampu menangani data dalam jumlah banyak secara efisien. Flutter juga menyediakan fitur builder yang memungkinkan item dibuat secara dinamis sesuai kebutuhan.

Beberapa fungsi utama ListView:

Menampilkan data secara terurut
Mendukung scrolling otomatis
Menampilkan data dinamis
Menghemat penggunaan memori dengan builder

Jenis-jenis ListView pada Flutter:

ListView
ListView.builder
ListView.separated
ListView.custom

## 3. Teori Dasar GridView

GridView adalah widget Flutter yang digunakan untuk menampilkan data dalam bentuk grid atau susunan beberapa kolom. GridView sangat cocok digunakan untuk tampilan yang bersifat visual seperti galeri gambar, daftar menu, dan katalog produk.

GridView memberikan tampilan yang lebih fleksibel karena item dapat disusun dalam beberapa kolom sekaligus. Selain itu, widget ini juga mendukung scrolling sehingga tetap nyaman digunakan meskipun jumlah data banyak.

Keunggulan GridView:

Tampilan lebih rapi dan modern
Cocok untuk data visual
Menampilkan banyak item dalam satu layar
Mendukung layout responsif

Jenis-jenis GridView pada Flutter:

GridView.count
GridView.builder
GridView.extent
GridView.custom

## 4. Peranan ListView dan GridView dalam Pengembangan Aplikasi

ListView dan GridView memiliki peranan penting dalam pengembangan aplikasi karena keduanya membantu pengembang menampilkan data secara terstruktur dan mudah dipahami pengguna.

ListView lebih sering digunakan untuk:

Data teks
Riwayat aktivitas
Daftar informasi

Sedangkan GridView lebih cocok untuk:

Gambar atau ikon
Katalog produk
Dashboard menu aplikasi

Penggunaan widget yang tepat dapat meningkatkan kenyamanan pengguna dalam mengakses informasi pada aplikasi.

## 5. Kesimpulan

ListView dan GridView merupakan widget penting pada Flutter yang digunakan untuk menampilkan data dalam bentuk daftar maupun grid. ListView digunakan untuk tampilan linear, sedangkan GridView digunakan untuk tampilan berbentuk kisi-kisi. Kedua widget tersebut mendukung scrolling dan pengelolaan data dinamis sehingga sangat membantu dalam pembuatan aplikasi yang interaktif dan responsif.

## Task 2 Mobile Flutter

Kalian diminta untuk membuat tampilan mirip lms web kampus dimana terdapat 2 grid kanan kiri yang berisikan tugas mata kuliah yang paling mendekati dengan deadline, dan di bawah nya menampilkan 8 list view yang berisikan list tugas (diluar yang dari 2 grid tadi) berisikan nama tugas, mata kuliah apa, deadline, dan data tambahan lain nya.

Ketentuan:
- Menggunakan GridView untuk tampilan grid kanan dan kiri
- Menggunakan ListView (boleh dengan builder boleh dengan separated, tapi ga boleh yang biasa)

### Source Code

```dart
import 'package:flutter/material.dart';
// 2311102265_Retha Anggreani - Tugas 2 - LMS Mobile
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar Tugas'),
    );
  }
}

// Model untuk Task
class Task {
  final String id;
  final String title;
  final String course;
  final String deadline;
  final int daysUntilDeadline;
  final String description;
  final String status; // 'pending', 'submitted', 'graded'
  final String professor;

  Task({
    required this.id,
    required this.title,
    required this.course,
    required this.deadline,
    required this.daysUntilDeadline,
    required this.description,
    required this.status,
    required this.professor,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Task> priorityTasks;
  late List<Task> allTasks;

  @override
  void initState() {
    super.initState();
    _initializeTasks();
  }

```
**Kode Lengkap:** [lib/main.dart](lib/main.dart)

### Penjelasan Kode
Aplikasi ini menampilkan GridView 2-kolom untuk 2 tugas dengan deadline terdekat (prioritas), dan di bawahnya ListView.separated dengan 8 tugas lengkap yang menampilkan nama tugas, mata kuliah, deadline, dan dosen pengampu. Desain menggunakan palet warna ungu dengan status indicator berwarna yang menunjukkan urgensi tugas

### Output

<img alt="Screenshot Tampilan LMS App" src="Halaman LMS.PNG" />
