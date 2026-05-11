# Flutter Development Guide

Panduan ini digunakan untuk menjalankan dan mengembangkan project Flutter secara lokal.

## Requirements

Pastikan perangkat telah memiliki beberapa tools berikut:

- Flutter SDK
- Dart SDK
- Android Studio atau VS Code
- Android SDK

## Install Dependency

Jalankan perintah berikut untuk mengunduh seluruh dependency project.

```bash
flutter pub get
```

## Menjalankan Project

Pastikan emulator atau device telah aktif, kemudian jalankan:

```bash
flutter run
```

## Build APK

Untuk membuat file APK release:

```bash
flutter build apk --release
```

Hasil build dapat ditemukan pada folder:

```text
build/app/outputs/flutter-apk/
```

## Struktur Project

```text
lib
├── main.dart
├── models
│   └── task_model.dart
├── screens
│   └── dashboard_screen.dart
└── widgets
    ├── task_list_tile.dart
    └── urgent_task_card.dart
```

## Catatan

> Gunakan Flutter versi stabil terbaru agar kompatibilitas package tetap terjaga. Jika terjadi error dependency, jalankan kembali `flutter clean` kemudian `flutter pub get`.