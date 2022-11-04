import 'package:flutter/material.dart';

class ComponentsPage extends StatelessWidget {
  static String routeName = '/components';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text('first'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text('second'),
            ),
          ],
        ));
  }
}
