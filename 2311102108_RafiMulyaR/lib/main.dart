import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart'; 

/// Titik masuk utama aplikasi LMS Task.
///
/// Fungsi ini menginisialisasi aplikasi dan menjalankan
/// widget utama untuk memulai antarmuka pengguna.
void main() {
  runApp(const MyApp());
}

/// Widget root yang mengonfigurasi tema dan navigasi.
///
/// MyApp mengatur identitas visual aplikasi seperti warna,
/// font, dan menentukan halaman pertama yang ditampilkan.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF37352F)),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const DashboardScreen(), 
    );
  }
}