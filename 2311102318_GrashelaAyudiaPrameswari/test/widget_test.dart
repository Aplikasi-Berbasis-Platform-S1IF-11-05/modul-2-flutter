import 'package:flutter_test/flutter_test.dart';
import 'package:lms_app/main.dart';

void main() {
  testWidgets('LMS app renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const LmsApp());

    expect(find.text('Hi, Grashela!'), findsOneWidget);
    expect(find.text('Segera Dikumpulkan'), findsOneWidget);
    expect(find.text('Tugas Mendatang'), findsOneWidget);
  });
}
