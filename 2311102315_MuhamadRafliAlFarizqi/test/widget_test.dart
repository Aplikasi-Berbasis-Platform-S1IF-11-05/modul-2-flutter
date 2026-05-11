import 'package:flutter_test/flutter_test.dart';
import 'package:lms_app/main.dart';

void main() {
  testWidgets('LMS app renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const LmsApp());

    expect(find.text('LMS Kampus'), findsOneWidget);
    expect(find.text('Deadline Terdekat'), findsOneWidget);
    expect(find.text('Daftar Tugas Lainnya'), findsOneWidget);
  });
}
