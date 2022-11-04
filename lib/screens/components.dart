import 'package:flutter/material.dart';
import 'package:testing_app/screens/favoriteshome.dart';
import 'package:testing_app/screens/text_edit.dart';

const favoritesKey = Key("favorites");

class ComponentsPage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: ListView(
          children: [
            ComponentListItem(
              child: TextButton(
                  key: favoritesKey,
                  onPressed: () {
                    Navigator.pushNamed(context, FavoritesHomePage.routeName);
                  },
                  child: Text('Favorites')),
            ),
            ComponentListItem(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TextEdit.routeName);
                  },
                  child: Text('Text edit')),
            ),
          ],
        ));
  }
}

class ComponentListItem extends StatelessWidget {
  final Widget child;
  const ComponentListItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10), child: child);
  }
}
