import 'dart:convert';

import 'package:elve_tcg_poke/env/env.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.client.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.settings.dart';

void main() async {
  late final PokemonTCGSettings settings;
  late final PokemonTCGClient client;

  /// once before all.
  setUpAll(() {
    settings = PokemonTCGSettings(
      apiKey: Env.apiKey,
      authority: Env.authority,
      apiVersion: Env.apiVersion,
    );
    client = PokemonTCGClient(settings);
  });

  /// ✅
  group('Test Card Service - ', () {
    test('GET Card', () async {
      // const id = 'pl1-1';
      const id = 'xy7-54';
      final card = await client.cards.card(id);
      print(jsonEncode(card));
      expect(card.id, id);
    });

    /// ✅
    test('GET Card List - simple', () async {
      final pagedResult = await client.cards.cards();
      print(jsonEncode(pagedResult.data));
      expect(pagedResult.data, isNotEmpty);
      expect(pagedResult.count, isNot(0));
      expect(pagedResult.page, 1);
    });

    test('GET Card List - complex', () async {
      const query = 'char';
      final pagedResult =
          await client.cards.cards(query: query, pageSize: 30, page: 1);
      print(jsonEncode(pagedResult.data));
      expect(pagedResult.data, isNotEmpty);
      expect(pagedResult.count, isNot(0));
      expect(pagedResult.page, 1);
    });
  });

  group('Test Set Service - ', () {
    /// ✅
    test('GET Set', () async {
      const id = 'xy7';
      final cardSet = await client.sets.cardSet('xy7');
      print(jsonEncode(cardSet));
      expect(cardSet.id, id);
    });

    /// ✅
    test('GET Set List', () async {
      final pagedResult = await client.sets.cardSets();
      print(jsonEncode(pagedResult.data));
      expect(pagedResult.data, isNotEmpty);
      expect(pagedResult.count, isNot(0));
      expect(pagedResult.page, 1);
    });
  });

  /// ✅
  group('Test Enums - ', () {
    test('GET Rarities', () async {
      final rarityList = await client.rarities.rarities();
      print(rarityList);
      expect(rarityList, isNotEmpty);
    });

    test('GET Types', () async {
      final typeList = await client.types.types();
      print(typeList);
      expect(typeList, isNotEmpty);
    });

    test('GET Supertypes', () async {
      final supertypeList = await client.supertypes.supertypes();
      print(supertypeList);
      expect(supertypeList, isNotEmpty);
    });

    test('GET Subtypes', () async {
      final subtypeList = await client.subtypes.subtypes();
      print(subtypeList);
      expect(subtypeList, isNotEmpty);
    });
  });
}
