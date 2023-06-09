// Packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart'; // flutter pub add spreadsheet_decoder

// Files
import 'character.dart';

/// Creates and returns list of Characters from Character Info.xlsx
List? createCharactersList()
{
  List charList = [];

  /* Initialize Spreadsheet Decoders */
  var characterInfoFile = './lib/Excel Sheets/Character Info.xlsx';
  var characterInfoBytes = File(characterInfoFile).readAsBytesSync();
  var characterInfoDecoder = SpreadsheetDecoder.decodeBytes(characterInfoBytes, update: true);

  var characterImageFile = './lib/Excel Sheets/Character Images.xlsx';
  var characterImageBytes = File(characterImageFile).readAsBytesSync();
  var characterImageDecoder = SpreadsheetDecoder.decodeBytes(characterImageBytes, update: true);

  var characterDescriptionFile = './lib/Excel Sheets/Character Descriptions.xlsx';
  var characterDescriptionBytes = File(characterDescriptionFile).readAsBytesSync();
  var characterDescriptionDecoder = SpreadsheetDecoder.decodeBytes(characterDescriptionBytes, update: true);

  /* ASSUMED CHARACTER INFO,CHARACTER IMAGES, and CHARACTER DESCRIPTIONS HAVE THE SAME # OF ROWS */
  for (var table in characterInfoDecoder.tables.keys) {  // for all sheets in excel file
    // print(table);
    // print(decoder.tables[table]!.maxCols);
    // print(decoder.tables[table]!.maxRows);
    for(int index = 0;  (index < characterInfoDecoder.tables[table]!.rows.length) && 
                        (index < characterImageDecoder.tables[table]!.rows.length) &&
                        (index < characterDescriptionDecoder.tables[table]!.rows.length); index++) {
      List character = characterInfoDecoder.tables[table]!.rows.elementAt(index);
      List image = characterImageDecoder.tables[table]!.rows.elementAt(index);
      List description = characterDescriptionDecoder.tables[table]!.rows.elementAt(index);
      
      Map skillList = {
        'ca': Skill(  // Charge Attack
          name: description[2], 
          description: description[3], 
          imageLink: 'https://gbf.wiki/images/thumb/c/c1/Skill_charge_attack.png/50px-Skill_charge_attack.png',
          /* CHANGE TO A GBF LINK OF CA IMAGE OR SAVE LOCALLY */
          ),
        's1': Skill(  // Skill 1
          name: description[4] ?? '', // ?? operator checks if Null, assign empty String 
          description: description[5],
          imageLink: image[4],
          ),
        's2': Skill(  // Skill 2
          name: description[6] ?? '', 
          description: description[7] ?? '', 
          imageLink: image[5] ?? '',
          ),
        's3': Skill(  // Skill 3
          name: description[8] ?? '',
          description: description[9] ?? '',
          imageLink: image[6] ?? '',
          ),
        's4': Skill(  // Skill 4
          name: description[10] ?? '',
          description: description[11] ?? '',
          imageLink: image[7] ?? '',
          ),
      };
      Character gbfCharacter;
      gbfCharacter = Character(
        // from Character Info
        name:     character[0],
        number:   character[1], 
        rarity:   character[2], 
        element:  character[3], 
        style:    character[4], 
        race:     character[5], 
        sex:      character[6],
        uncap:    character[7], 
        hp:       character[8], 
        atk:      character[9], 
        weapon1:  character[10], 
        weapon2:  character[11], 
        wikiLink: character[12],

        // from Character Images
        iconLink: image[2],
        imageLink: image[3],
        recruitmentWeapon: image[8],

        // from Character Descriptions
        skillList: skillList,  
      );
      charList.add(gbfCharacter);
    }        
  }
  return charList;
}


void main() {
  // runApp(const MainApp());
  var charList = createCharactersList();
  print('Number of Characters: ${charList?.length}');
  // print(charList!.first);
  // print(charList.last);
  Character? searched;
  if (charList != null) {
    for (var gbf_char in charList) {  
      if (gbf_char.getName() == 'Abby') {   // Example of searching list
        searched = gbf_char;
        break;
      }
    }
  }
  print('Recruitment weapon for ${searched?.getName()}: ${searched?.getRecruitmentWeapon()}');
  // print(searched);
  // print('**********************************************************');
  // var searchedSkills = searched?.getSkillList().forEach((k, v) => print('$k: $v'));
  // print(searched?.getSkillList()['s1']);
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
