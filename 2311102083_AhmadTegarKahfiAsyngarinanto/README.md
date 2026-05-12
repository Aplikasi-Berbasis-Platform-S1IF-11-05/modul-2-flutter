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
    <strong>Ahmad Tegar Kahfi Asyngarinanto</strong>
    <br>
    <strong>2311102083</strong>
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

# 1. Dasar Teori

## Bahasa Pemrograman Dart

Dart adalah bahasa pemrograman buatan Google yang menjadi fondasi utama dari framework Flutter. Dart dirancang untuk menghasilkan aplikasi berperforma tinggi yang dapat berjalan di berbagai platform seperti mobile, web, dan desktop.

Dart mendukung paradigma Object Oriented Programming (OOP) yang mencakup konsep seperti class, object, constructor, inheritance, dan function. Hal ini memudahkan pengembang dalam menyusun kode yang terstruktur dan mudah dipelihara.

Dalam konteks Flutter, Dart digunakan untuk menulis logika aplikasi, menyusun tampilan antarmuka, serta mengelola alur data yang berjalan di dalam aplikasi.

## Framework Flutter

Flutter adalah framework open-source besutan Google yang memungkinkan pembuatan aplikasi lintas platform hanya dengan satu kodebase. Dengan Flutter, aplikasi Android, iOS, web, dan desktop dapat dibangun secara bersamaan tanpa perlu menulis ulang kode untuk setiap platform.

Salah satu keunggulan Flutter adalah fitur hot reload yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa harus merestart aplikasi. Flutter juga memiliki rendering engine tersendiri sehingga tampilan aplikasi konsisten dan performanya tetap optimal di berbagai perangkat.

## Konsep Widget

Widget adalah unit dasar pembangunan antarmuka di Flutter. Semua elemen visual seperti teks, gambar, tombol, hingga tata letak halaman semuanya direpresentasikan sebagai widget.

Terdapat dua kategori utama widget di Flutter, yaitu StatelessWidget dan StatefulWidget. StatelessWidget cocok digunakan untuk komponen yang tampilannya tetap dan tidak berubah, sedangkan StatefulWidget digunakan ketika tampilan perlu berubah secara dinamis mengikuti interaksi atau perubahan data selama aplikasi berjalan.

## User Interface pada Flutter

Flutter menyediakan koleksi widget yang lengkap untuk membangun antarmuka aplikasi yang modern dan responsif. Beberapa widget yang sering dipakai antara lain Scaffold sebagai struktur dasar halaman, AppBar sebagai bagian header, serta Row dan Column untuk mengatur posisi elemen secara horizontal maupun vertikal.

Pemilihan widget yang tepat sangat berpengaruh terhadap kerapian tampilan dan kemudahan penggunaan aplikasi oleh pengguna akhir.

## GridView dan Implementasinya

GridView adalah widget Flutter yang berfungsi menampilkan kumpulan data dalam susunan grid dengan beberapa kolom. Widget ini sangat cocok untuk menampilkan konten berbentuk kartu seperti daftar menu, galeri foto, atau ringkasan informasi.

Pada praktikum ini, GridView.builder digunakan untuk menampilkan dua tugas dengan tenggat waktu terdekat dalam susunan dua kolom yang berdampingan, mengikuti gaya tampilan LMS web kampus.

## ListView dan Implementasinya

ListView adalah widget Flutter yang digunakan untuk menampilkan daftar item secara berurutan, baik secara vertikal maupun horizontal. Flutter menyediakan beberapa varian ListView seperti ListView.builder dan ListView.separated sesuai kebutuhan tampilan.

Pada praktikum ini digunakan ListView.separated untuk menampilkan sisa daftar tugas di bawah GridView. Varian ini dipilih karena secara otomatis menyisipkan pemisah antar item sehingga daftar terlihat lebih rapi dan mudah dibaca.

## Material Design

Material Design adalah sistem desain yang dikembangkan Google sebagai panduan dalam membangun antarmuka aplikasi yang modern, bersih, dan konsisten di berbagai ukuran layar.

Flutter mengintegrasikan Material Design melalui widget-widget bawaan seperti MaterialApp, AppBar, Card, dan FloatingActionButton, sehingga pengembang dapat dengan mudah membangun tampilan yang profesional tanpa banyak konfigurasi tambahan.

# 2. Pembahasan Tugas

## Persiapan Project Flutter

Langkah pertama dalam pengerjaan praktikum ini adalah membuat project Flutter baru melalui terminal menggunakan perintah Flutter. Project ini bertujuan untuk mengimplementasikan tampilan sederhana menyerupai LMS kampus dengan memanfaatkan widget GridView dan ListView.

Setelah project berhasil dibuat, seluruh pengembangan dilakukan menggunakan Visual Studio Code dan dijalankan pada emulator Android untuk memastikan aplikasi dapat berjalan dengan normal.

## Pembuatan Data Tugas

Data tugas disimpan menggunakan struktur List<Map<String, dynamic>> yang mampu menampung informasi seperti nama tugas, mata kuliah, tenggat waktu, dan status penyelesaian tugas.

Data inilah yang nantinya menjadi sumber tampilan pada GridView maupun ListView seperti terlihat pada Gambar 2.1.

![Bukti](assets/classAssignment.png)

Gambar 2.1 Struktur Data Tugas yang Digunakan

## Implementasi GridView

GridView.builder diimplementasikan untuk menampilkan dua tugas dengan prioritas tertinggi dalam layout dua kolom. Susunan ini dipilih agar tampilan lebih menyerupai halaman LMS web yang sudah familiar bagi mahasiswa.

Setiap card dalam grid memuat informasi nama tugas, mata kuliah asal, serta batas waktu pengumpulan seperti ditunjukkan pada Gambar 2.2.

![Bukti](assets/GridViewBuilder.png)

Gambar 2.2 Implementasi GridView.builder

## Implementasi ListView

ListView.separated digunakan untuk menampilkan daftar tugas lainnya yang berada di bawah bagian GridView. Penggunaan varian separated memberikan garis pemisah otomatis antar item sehingga daftar terlihat lebih teratur dan nyaman dibaca seperti pada Gambar 2.3.

![Bukti](assets/ListViewSeparated.png)

Gambar 2.3 Implementasi ListView.separated

## Desain Tampilan Aplikasi

Tampilan keseluruhan aplikasi menggunakan widget Card agar setiap informasi tugas tersaji dalam kotak yang bersih dan modern. Pembedaan warna pada setiap card digunakan sebagai indikator visual tingkat prioritas tugas seperti ditunjukkan pada Gambar 2.4.

![Bukti](assets/image.png)

Gambar 2.4 Tampilan Akhir Aplikasi pada Emulator

## Pengujian Aplikasi

Setelah seluruh implementasi selesai dilakukan, aplikasi diuji coba pada emulator Android. Hasil pengujian menunjukkan bahwa GridView dan ListView berhasil menampilkan data tugas sesuai dengan ketentuan yang ditetapkan dalam soal praktikum.

## Hasil Akhir

Aplikasi berhasil menampilkan tampilan sederhana yang menyerupai halaman LMS kampus. Dua tugas dengan tenggat terdekat ditampilkan pada bagian GridView di atas, sementara delapan tugas lainnya ditampilkan secara berurutan menggunakan ListView di bawahnya.
