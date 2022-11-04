import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/main.dart';
import 'package:testing_app/screens/components.dart';
import 'package:testing_app/screens/favoriteshome.dart';
import 'package:testing_app/screens/text_edit.dart';

void main() {
  group('Components app', () {
    testWidgets('Navigate to favorites and back', (tester) async {
      await tester.pumpWidget(TestingApp());

      await tester.tap(find.byKey(favoritesKey));
      await tester.pumpAndSettle();

      expect(find.byType(FavoritesHomePage), findsOneWidget);

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      expect(find.byType(ComponentsPage), findsOneWidget);
    });

    testWidgets('Navigate to text edit', (tester) async {
      await tester.pumpWidget(TestingApp());

      await tester.tap(find.byKey(textEditKey));
      await tester.pumpAndSettle();

      expect(find.byType(TextEdit), findsOneWidget);
    });
  });
}
