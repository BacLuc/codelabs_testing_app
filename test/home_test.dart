import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/home.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets("ListView renders", (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.text('Item 0'), findsOneWidget);

      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();

      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('No items are initially favorites', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      expect(find.byIcon(Icons.favorite), findsNothing);
    });

    testWidgets('toggle favorites on', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      const itemNr = 3;
      await tester.tap(find.byIcon(Icons.favorite_border).at(itemNr));
      await tester.pumpAndSettle();

      expect(find.text('Added to favorites.'), findsOneWidget);
      expect(
          find.descendant(
              of: find.byKey(Key('icon_$itemNr')),
              matching: find.byIcon(Icons.favorite)),
          findsOneWidget);

      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.text('Added to favorites.'), findsNothing);
    });

    testWidgets('toggle favorites off', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      const itemNr = 3;
      await tester.tap(find.byIcon(Icons.favorite_border).at(itemNr));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(Duration(milliseconds: 500));

      expect(find.text('Removed from favorites.'), findsOneWidget);
      expect(
          find.descendant(
              of: find.byKey(Key('icon_$itemNr')),
              matching: find.byIcon(Icons.favorite_border)),
          findsOneWidget);

      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.text('Removed from favorites.'), findsNothing);
    });
  });
}
