import 'package:cs311hw08/character_detail.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_list_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets("CharacterList should display Listview", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters")))
        .thenAnswer(
            (_) async => http.Response('["albedo","aloy","amber"]', 200));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client),
      ),
    ));
    await tester.pumpAndSettle();

    final listItem = find.byType(ListView);
    // Expect to find one ListTile widget

    expect(listItem, findsWidgets);
  });

  testWidgets("CharacterList should display ListTile", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters")))
        .thenAnswer(
            (_) async => http.Response('["albedo","aloy","amber"]', 200));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client),
      ),
    ));
    await tester.pumpAndSettle();
    final listTile = find.byType(ListTile);
    // Expect to find one ListTile widget

    expect(listTile, findsWidgets);
  });

  testWidgets("CharacterList has error", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters")))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client),
      ),
    ));
    await tester.pumpAndSettle();

    final listErrorText = find.byType(Text);
    expect(listErrorText, findsOneWidget);
  });

  testWidgets("CharacterList is scrollable", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters")))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client),
      ),
    ));
    await tester.pumpAndSettle();

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byType(ListView);
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );
    expect(itemFinder, findsOneWidget);
  });

  testWidgets("CharacterList listtile can tap", (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse("https://api.genshin.dev/characters")))
        .thenAnswer(
            (_) async => http.Response('["albedo","aloy","amber"]', 200));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client),
      ),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ListTile).first); 
    await tester.pumpAndSettle();
    expect(find.byType(CharacterDetail), findsOneWidget);  
  });
}
