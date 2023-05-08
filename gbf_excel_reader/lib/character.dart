enum Rarity {SSR, SR, R}

enum Element {Fire, Water, Earth, Wind, Light, Dark}

/// class for Granblue Fantasy characters
class Character {
  String? name, rarity, element, style, race, sex, weapon1, weapon2;
  int? number, uncap, hp, atk;
  String? wikiLink, iconLink, imageLink;
  Map? skillList;
  String? recruitmentWeapon;

  /// constructor with required named parameters
  Character(
    {
      required String name, 
      required String rarity, 
      required String element, 
      required String style, 
      required String race, 
      required String sex, 
      required String weapon1,  // aka Specialty 
      required String? weapon2, // aka Specialty 
      required int number, 
      required int uncap, 
      required int hp, 
      required int atk,
      required String? wikiLink,
      required String? iconLink,
      required String? imageLink,
      required Map skillList,
      required String? recruitmentWeapon,
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
    this.recruitmentWeapon = recruitmentWeapon;
  }

  // accessors/getters
  // removing void here resolved use_of_void_result
  getName() => name;
  getRarity() => rarity;
  getElement() => element;
  getStyle() => style;
  getRace() => race;
  getSex() => sex;
  getWeapon1() => weapon1;
  getWeapon2() => weapon2;
  getNumber() => number;
  getUncap() => uncap;
  getHp() => hp;
  getAtk() => atk;
  getWikiLink() => wikiLink;
  getIconLink() => iconLink;
  getImageLink() => imageLink;
  getSkillList() => skillList;    
  getRecruitmentWeapon() => recruitmentWeapon;

  @override
  String toString() {
    return
          'Name: $name\n'
          'Number: $number\n'
          'Rarity: $rarity\n'
          'Element: $element\n'
          'Style: $style\n'
          'Race: $race\n'
          'Sex: $sex\n'
          'Uncap: $uncap\n'
          'HP: $hp\n'
          'ATK: $atk\n'
          'Weapon 1: $weapon1\n'
          'Weapon 2: $weapon2\n'
          'GBF Wiki Link: $wikiLink\n'
          'Character Icon Link: $iconLink\n'
          'Character Image Link: $imageLink\n'
          'Character Skill List: $skillList\n'
          'Recruitment Weapon: $recruitmentWeapon\n'
    ;
    // return super.toString();
  }
}

/// class used for both Charge Attack and Skills
/// - to be used in a Map of Skills
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

  getName() => name;
  getDescription() => description;
  getImageLink() => imageLink;

  @override
  String toString() {
    return  'Skill name: $name\n'
            'Skill description: $description\n' 
            'Skill image: $imageLink\n'
    ;
  }
}