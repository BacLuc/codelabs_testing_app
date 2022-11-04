import 'package:flutter/material.dart';

final Key displayTextKey = UniqueKey();
final Key textInputKey = UniqueKey();
const int maxLength = 10;

class TextEdit extends StatefulWidget {
  static const routeName = '/text-edit';

  @override
  State<StatefulWidget> createState() => _TextEditState();
}

class _TextEditState extends State<TextEdit> {
  final _textController = TextEditingController();
  String currentText = '';

  @override
  void initState() {
    _textController.addListener(() {
      setState(() {
        currentText = _textController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Edit'),
      ),
      body: ListView(
        children: [
          Text(key: displayTextKey, _textController.text),
          TextFormField(
            key: textInputKey,
            controller: _textController,
            maxLength: maxLength,
          )
        ],
      ),
    );
  }
}
