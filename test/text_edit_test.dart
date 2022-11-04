import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/screens/text_edit.dart';

Widget createWidget() => MaterialApp(
      home: TextEdit(),
    );

void main() {
  group('Text Edit', () {
    testWidgets('has no text at startup', (tester) async {
      await tester.pumpWidget(createWidget());

      Text displayText = tester.widget(find.byKey(displayTextKey));
      expect(displayText.data, equals(''));

      TextFormField textInput = tester.widget(find.byKey(textInputKey));
      expect(textInput.controller?.text, equals(''));
    });

    testWidgets('shows the text typed into field', (tester) async {
      const text = 'text';
      await tester.pumpWidget(createWidget());

      await tester.enterText(find.byKey(textInputKey), text);
      await tester.pumpAndSettle();

      Text displayText = tester.widget(find.byKey(displayTextKey));
      expect(displayText.data, equals(text));
    });

    testWidgets('has a maxLength', (tester) async {
      final fittingText = 't' * maxLength;
      final tooLongText = '${fittingText}t';
      await tester.pumpWidget(createWidget());

      await tester.enterText(find.byKey(textInputKey), tooLongText);
      await tester.pumpAndSettle();

      Text displayText = tester.widget(find.byKey(displayTextKey));
      expect(displayText.data, equals(fittingText));
    });
  });
}
