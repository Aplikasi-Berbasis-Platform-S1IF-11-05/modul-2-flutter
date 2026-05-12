import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/lms_dashboard.dart';

void main() {
  testWidgets('LmsDashboard UI elements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LmsDashboard()));

    // Memastikan judul AppBar benar
    expect(find.text('LMS Web Kampus'), findsOneWidget);

    // Memastikan label section ada
    expect(find.text('Tugas Terdekat (Deadline)'), findsOneWidget);
    expect(find.text('Daftar Tugas Lainnya (ListView)'), findsOneWidget);

    // Memastikan GridView ada (minimal cek salah satu item di grid)
    expect(find.text('Tugas Proyek Akhir'), findsOneWidget);
    expect(find.text('Laporan Praktikum 8'), findsOneWidget);

    // Memastikan ListView ada (minimal cek salah satu item di list)
    expect(find.text('Quiz 2'), findsOneWidget);
    expect(find.text('Testing & QA'), findsOneWidget);

    // Memastikan jumlah ListTile yang ada di ListView (seharusnya ada 8)
    // Catatan: find.byType(ListTile) mungkin menemukan lebih banyak jika ada ListTile lain
    // tapi di dashboard ini hanya ada 8 di ListView.
    expect(find.byType(ListTile), findsNWidgets(8));

    // Memastikan Grid item menggunakan Card
    expect(find.byType(Card), findsAtLeastNWidgets(2));
  });
}
