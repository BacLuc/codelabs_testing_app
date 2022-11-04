import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/components.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/screens/favoriteshome.dart';
import 'package:testing_app/screens/text_edit.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          ComponentsPage.routeName: (context) => ComponentsPage(),
          FavoritesHomePage.routeName: (context) => FavoritesHomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
          TextEdit.routeName: (context) => TextEdit(),
        },
        initialRoute: ComponentsPage.routeName,
      ),
    );
  }
}
