import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:registration_clean_architecture/src/core/util/injections.dart';
import 'package:registration_clean_architecture/src/feature/registration/presentation/page/registration_page.dart';
import 'package:registration_clean_architecture/main.dart';

void main() {
  testWidgets('MyApp displays RegistrationPage', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MultiProvider(
        providers: providers,
        child: const MyApp(),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(RegistrationPage), findsOneWidget);
  });
}
