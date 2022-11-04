import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/screens/favorites.dart';

import 'util/dimension.dart';

void main() {
  group('FavoritesList', () {
    testWidgets('shows no favorites if empty', (tester) async {
      await tester.pumpWidget(createWidget(items: []));

      expect(find.text('No favorites'), findsOneWidget);
      expect(find.byType(FavoriteItemTile), findsNothing);
    });

    testWidgets('shows favorites from list', (tester) async {
      await tester.pumpWidget(createWidget(items: [2, 3, 100]));

      expect(find.text('No favorites'), findsNothing);
      expect(find.byType(FavoriteItemTile), findsNWidgets(3));
    });

    for (var dim in [
      Dimension(width: 1080, height: 2020),
      Dimension(width: 2020, height: 1080),
      Dimension(width: 300, height: 812)
    ]) {
      testWidgets('empty list matches golden file for dim $dim',
          (tester) async {
        tester.binding.window.physicalSizeTestValue =
            Size(dim.width, dim.height);
        await tester.pumpWidget(createWidget(items: [1, 2, 3]));

        await expectLater(find.byType(FavoritesList).first,
            matchesGoldenFile('goldens/favorites/$dim/favoritesList.png'));
      });
    }
  });
}

Widget createWidget({List<int> items = const []}) =>
    MaterialApp(home: Scaffold(body: FavoritesList(items: items)));
