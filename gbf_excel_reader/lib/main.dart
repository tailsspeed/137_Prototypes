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

  var characterInfoFile = './lib/Excel Sheets/Character Info.xlsx';
  var characterInfoBytes = File(characterInfoFile).readAsBytesSync();
  var characterInfoDecoder = SpreadsheetDecoder.decodeBytes(characterInfoBytes, update: true);

  var characterImageFile = './lib/Excel Sheets/Character Images.xlsx';
  var characterImageBytes = File(characterImageFile).readAsBytesSync();
  var characterImageDecoder = SpreadsheetDecoder.decodeBytes(characterImageBytes, update: true);

  /* ASSUMED BOTH CHARACTER INFO AND CHARACTER IMAGES HAVE THE SAME # OF ROWS */
  for (var table in characterInfoDecoder.tables.keys) {  // for all sheets in excel file
    // print(table);
    // print(decoder.tables[table]!.maxCols);
    // print(decoder.tables[table]!.maxRows);
    for(int index = 0; (index < characterInfoDecoder.tables[table]!.rows.length) && index < (characterImageDecoder.tables[table]!.rows.length); index++) {
      List character = characterInfoDecoder.tables[table]!.rows.elementAt(index);
      List image = characterImageDecoder.tables[table]!.rows.elementAt(index);
      
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
  if (charList != null) {
    print('Characters with Wind Element:');
    for (var gbf_char in charList) {  
      if (gbf_char.getElement() == 'Wind') {   // Example of searching list
        print(' ${gbf_char.getName()}');
      }
    }
  }
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
