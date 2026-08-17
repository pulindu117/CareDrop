import 'package:flutter_test/flutter_test.dart';
import 'package:caredrop/app.dart';

void main() {
  testWidgets('CareDrop app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const CareDropApp());

    expect(find.text('CareDrop'), findsWidgets);
  });
}