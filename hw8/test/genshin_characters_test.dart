import 'package:cs311hw08/genshin_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'genshin_characters_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetchCharacters_test", () {
    test('returns GenshinCharacters if the http call completes successfully',
        () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
          .thenAnswer((_) async => http.Response(
              '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
      expect(await fetchCharacters(client), isA<GenshinCharacters>());
    });
    test("Fetch data fail", () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchCharacters(client), throwsException);
    });
  });

  group("fetchCharacterInfo_test", () {
    test("Fetch info success", () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters/Raiden')))
          .thenAnswer((_) async => http.Response(
              '{"name": "Raiden Shogun","vision": "Electro","weapon": "Polearm","nation": "Inazuma","description": "Her Excellency, the Almighty, Narukami Ogosho, who promised the people of Inazuma an unchanging Eternity."}',
              200));

      expect(await fetchCharacterInfo(client, "Raiden"), isA<CharacterInfo>());
    });
    test("Fetch info fail", () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters/Raiden')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchCharacterInfo(client, "Raiden"), throwsException);
    });
  });
}
