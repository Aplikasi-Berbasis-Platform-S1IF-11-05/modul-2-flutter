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
    <strong>Verdi Pangestu</strong>
    <br>
    <strong>2311102100</strong>
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

## 1. Konsep Dasar Widget dalam Flutter
Dalam ekosistem Flutter, "Everything is a Widget". Widget merupakan unit dasar dari antarmuka pengguna (User Interface). Secara teori, Widget adalah sebuah deklarasi konfigurasi untuk elemen UI yang bersifat immutable (tidak berubah).

- Stateless Widget: Widget yang tidak memiliki state (keadaan) yang berubah setelah dibangun. Digunakan untuk UI statis.
- Stateful Widget: Widget yang dapat berubah secara dinamis selama aplikasi berjalan melalui pemanggilan fungsi setState().

## 2. Dasar-Dasar Layouting
Layouting di Flutter dilakukan dengan menyusun widget secara hierarkis (Widget Tree). Untuk menyusun elemen secara vertikal atau horizontal, digunakan:

- Column: Menyusun widget dari atas ke bawah.
- Row: Menyusun widget dari kiri ke kanan.
- Padding: Memberikan ruang kosong di sekeliling widget agar tampilan tidak menempel pada tepi layar.

## 3. GridView
GridView adalah widget yang digunakan untuk menampilkan data dalam bentuk tabel atau kotak (grid) dua dimensi (baris dan kolom). GridView sangat efektif untuk menampilkan item yang memiliki ukuran seragam, seperti galeri foto atau menu dashboard.

- SliverGridDelegateWithFixedCrossAxisCount: Digunakan untuk menentukan jumlah kolom yang tetap (misal: membagi layar menjadi 2 bagian kanan-kiri).
- crossAxisSpacing & mainAxisSpacing: Properti untuk mengatur jarak antar elemen dalam grid agar terlihat rapi.

## 4. ListView
ListView adalah widget linear paling populer untuk menampilkan daftar item yang dapat digulir (scrollable). Berbeda dengan Column yang akan error jika konten melebihi layar (overflow), ListView secara otomatis mendukung fitur scrolling.

- ListView.builder: Digunakan untuk menangani daftar item yang sangat panjang atau dinamis. Widget ini hanya akan memuat (render) item yang terlihat di layar, sehingga sangat efisien dalam penggunaan memori.
- ListView.separated: Merupakan variasi dari builder yang menyertakan parameter separatorBuilder, memungkinkan pengembang menambahkan elemen pemisah (seperti garis atau spasi) di antara tiap item daftar secara otomatis.

## Task 2 Mobile Flutter

Kalian diminta untuk membuat tampilan mirip lms web kampus dimana terdapat 2 grid kanan kiri yang berisikan tugas mata kuliah yang paling mendekati dengan deadline, dan di bawah nya menampilkan 8 list view yang berisikan list tugas (diluar yang dari 2 grid tadi) berisikan nama tugas, mata kuliah apa, deadline, dan data tambahan lain nya.

Ketentuan:
- Menggunakan GridView untuk tampilan grid kanan dan kiri
- Menggunakan ListView (boleh dengan builder boleh dengan separated, tapi ga boleh yang biasa)

### Source Code

```dart
//2311102100 - Verdi Pangestu
import 'package:flutter/material.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS Kampus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Arial',
      ),
      home: const LMSHomePage(),
    );
  }
}
```
**Kode Lengkap:** [lib/main.dart](lib/main.dart)

### Penjelasan Kode
**Dashboard LMS** (Learning Management System) yang berfungsi menampilkan daftar tugas mahasiswa. Halaman ini disusun menggunakan `GridView` untuk menyorot dua tugas dengan deadline terdekat di bagian atas, dan dilanjutkan dengan `ListView` di bawahnya untuk menampilkan delapan tugas lainnya beserta detail informasi mata kuliah dan tenggat waktu.


### Output

![alt text](<Cuplikan layar 2026-05-12 215213.png>)