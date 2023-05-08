enum Rarity {SSR, SR, R}

enum Element {Fire, Water, Earth, Wind, Light, Dark}

/// class for Granblue Fantasy characters
class Character {
  String? name, rarity, element, style, race, sex, weapon1, weapon2;
  int? number, uncap, hp, atk;
  String? wikiLink, iconLink, imageLink;
  Map? skillList;

  /// constructor with required named parameters
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
      required String? wikiLink,
      required String? iconLink,
      required String? imageLink,
      required Map skillList,
    }
  ) {
    this.name = name;
    this.rarity = rarity;
    this.element = element;
    this.style = style;
    this.race = race;
    this.sex = sex;
    this.weapon1 = weapon1;
    this.weapon2 = weapon2;
    this.number = number;
    this.uncap = uncap;
    this.hp = hp;
    this.atk = atk;
    this.wikiLink = wikiLink;
    this.iconLink = iconLink;
    this.imageLink = imageLink;
    this.skillList = skillList;
  }

  // accessors/getters
  void getName() => name;
  void getRarity() => rarity;
  void getElement() => element;
  void getStyle() => style;
  void getRace() => race;
  void getSex() => sex;
  void getWeapon1() => weapon1;
  void getWeapon2() => weapon2;
  void getNumber() => number;
  void getUncap() => uncap;
  void getHp() => hp;
  void getAtk() => atk;
  void getWikiLink() => wikiLink;
  void getIconLink() => iconLink;
  void getImageLink() => imageLink;
  void getSkillList() => skillList;

  @override
  String toString() {
    print('Name: $name');
    print('Number: $number');
    print('Rarity: $rarity');
    print('Element: $element');
    print('Style: $style');
    print('Race: $race');
    print('Sex: $sex');
    print('Uncap: $uncap');
    print('HP: $hp');
    print('ATK: $atk');
    print('Weapon 1: $weapon1');
    print('Weapon 2: $weapon2');
    print('GBF Wiki Link: $wikiLink');
    print('Character Icon Link: $iconLink');
    print('Character Image Link: $imageLink');
    print('Character Skill List: $skillList');
    return super.toString();
  }
}

/// class used for both Charge Attack and Skills
class Skill {
  String? name, description;
  String? imageLink;

  Skill(
    {
      required String this.name,
      required String this.description,
      required String this.imageLink,
    }
  );

  void getName() => name;
  void getDescription() => description;
  void getImageLink() => imageLink;

  @override
  String toString() {
    return 'Skill name: $name\n Skill description: $description\n Skill image: $imageLink\n';
  }
}