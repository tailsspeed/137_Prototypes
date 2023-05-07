enum Rarity {SSR, SR, R}

enum Element {Fire, Water, Earth, Wind, Light, Dark}

class Character {
  // from Character Info
  String? name, rarity, element, style, race, sex, weapon1, weapon2;
  int? number, uncap, hp, atk;
  String? wikiLink;

  /* MAY NEED TO ADD THIS. TO EVERY PARAM HERE */
  Character(
    {
      required String name, 
      required String rarity, 
      required String element, 
      required String style, 
      required String race, 
      required String sex, 
      required String weapon1, 
      required String? weapon2,
      required int number, 
      required int uncap, 
      required int hp, 
      required int atk,
      required String? wikiLink
    }
  );

  @override
  String toString() {
    // TODO: implement toString
    // print('Name: $name');
    // print('Number: $number');
    // print('Rarity: $rarity');
    // print('Element: $element');
    // print('Style: $style');
    // print('Race: $race');
    // print('Sex: $sex');
    // print('Uncap: $uncap');
    // print('HP: $hp');
    // print('ATK: $atk');
    // print('Weapon 1: $weapon1');
    // print('Weapon 2: $weapon2');
    // print('GBF Wiki Link: $wikiLink');
    print('test');
    return 'Name: $name';
  }
}

class Skill {
  String? name, description;
  String? image;
}