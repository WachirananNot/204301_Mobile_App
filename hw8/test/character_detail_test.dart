import 'package:cs311hw08/character_detail.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets("CharacterDetail should display column", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters/Raiden")))
        .thenAnswer((_) async => http.Response(
            '{"name": "Raiden Shogun","vision": "Electro","weapon": "Polearm","nation": "Inazuma","description": "Her Excellency, the Almighty, Narukami Ogosho, who promised the people of Inazuma an unchanging Eternity."}',
            200));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterDetail(name: "Raiden", client: client),
      ),
    ));
    await tester.pumpAndSettle();

    final columnItem = find.byType(Column);
    // Expect to find one ListTile widget

    expect(columnItem, findsOneWidget);
  });

  testWidgets("CharacterDetail column should display 5 texts", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters/Raiden")))
        .thenAnswer((_) async => http.Response(
            '{"name": "Raiden Shogun","vision": "Electro","weapon": "Polearm","nation": "Inazuma","description": "Her Excellency, the Almighty, Narukami Ogosho, who promised the people of Inazuma an unchanging Eternity."}',
            200));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterDetail(name: "Raiden", client: client),
      ),
    ));
    await tester.pumpAndSettle();

    final textItem = find.byType(Text);
    // Expect to find one ListTile widget

    expect(
        find.descendant(
            of: find.byType(Column), matching: textItem, matchRoot: true),
        findsNWidgets(5));
  });

  testWidgets("CharacterDetail has error", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters/Raiden")))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterDetail(name: "Raiden", client: client),
      ),
    ));
    await tester.pumpAndSettle();

    final detailErrorText = find.byType(Text);
    expect(detailErrorText, findsNWidgets(2));
  });
}
