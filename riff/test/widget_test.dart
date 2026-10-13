import 'package:flutter_test/flutter_test.dart';

import 'package:riff/main.dart';

void main() {
  testWidgets('Splash pasa automáticamente al Home', (tester) async {
    await tester.pumpWidget(const RiffApp());
    expect(find.text('RIFF'), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.text('Todos'), findsOneWidget);
    expect(find.text('Buscar guitarra...'), findsOneWidget);
  });
}
