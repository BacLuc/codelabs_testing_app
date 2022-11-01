import 'package:test/test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    Favorites favorites = Favorites();

    setUp(() => {favorites = Favorites()});

    for (var element in [0, -1, 1, 5, 100]) {
      test('Is initialized empty, thus $element is empty', () {
        expect(favorites.items.contains(element), false);
      });
    }

    test('A new item should be added', () {
      const number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('A item can be removed', () {
      const number = 3;
      favorites.add(number);
      expect(favorites.items.contains(number), true);

      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
