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
    <strong>Reza Alvonzo</strong>
    <br>
    <strong>2311102026</strong>
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

## 1. Flutter 
merupakan framework open-source yang dikembangkan oleh Google untuk membangun aplikasi mobile, web, dan desktop dengan satu basis kode menggunakan bahasa pemrograman Dart. Flutter menerapkan konsep widget sebagai komponen utama dalam pembuatan antarmuka pengguna (User Interface/UI). Dalam pengembangan aplikasi, Flutter menyediakan berbagai widget yang mempermudah pengembang dalam menampilkan dan mengelola data secara dinamis, salah satunya adalah ListView dan GridView.

## 2. ListView 
adalah widget yang digunakan untuk menampilkan data dalam bentuk daftar secara vertikal maupun horizontal. Widget ini cocok digunakan pada aplikasi yang menampilkan data berurutan seperti daftar kontak, pesan, berita, atau menu. ListView memiliki kemampuan scrolling otomatis sehingga pengguna tetap dapat melihat data dalam jumlah banyak dengan nyaman. Selain itu, Flutter menyediakan beberapa jenis ListView seperti ListView.builder dan ListView.separated untuk membantu pengelolaan data yang lebih efisien dan dinamis.

## 3. GridView
merupakan widget Flutter yang digunakan untuk menampilkan data dalam bentuk grid atau susunan baris dan kolom. Widget ini umumnya digunakan untuk tampilan yang lebih visual seperti galeri foto, katalog produk, maupun dashboard menu aplikasi. Dibandingkan ListView, GridView mampu menampilkan beberapa item dalam satu baris sehingga tampilan menjadi lebih ringkas dan menarik. Dengan adanya ListView dan GridView, pengembang dapat membangun antarmuka aplikasi yang lebih responsif, interaktif, dan mudah digunakan oleh pengguna.


## Task 2 Mobile Flutter

Kalian diminta untuk membuat tampilan mirip lms web kampus dimana terdapat 2 grid kanan kiri yang berisikan tugas mata kuliah yang paling mendekati dengan deadline, dan di bawah nya menampilkan 8 list view yang berisikan list tugas (diluar yang dari 2 grid tadi) berisikan nama tugas, mata kuliah apa, deadline, dan data tambahan lain nya.

Ketentuan:
- Menggunakan GridView untuk tampilan grid kanan dan kiri
- Menggunakan ListView (boleh dengan builder boleh dengan separated, tapi ga boleh yang biasa)

### Source Code

```dart
// 2311102026 - Reza Alvonzo - IF-11-05 - Praktikum Modul 2 Mobile Flutter
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
      title: 'Task 2 Mobile Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE2231A),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F3F1),
        useMaterial3: true,
      ),
      home: const LmsDashboardPage(),
    );
  }
}
```
**Kode Lengkap:** [lib/main.dart](lib/main.dart)

### Penjelasan Kode
Aplikasi ini menampilkan dashboard tugas bergaya LMS Telkom dengan 2 kartu GridView untuk tugas yang paling dekat deadlinenya, lalu 8 item ListView di bawahnya untuk tugas lainnya. Setiap kartu dan item memuat nama tugas, mata kuliah, deadline, serta informasi tambahan supaya tampilan lebih rapi dan mudah dipantau.

### Output

<img alt="Screenshot Tampilan LMS App" src="Task2 LMS.PNG" />
