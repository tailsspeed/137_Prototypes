// Packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart'; // flutter pub add spreadsheet_decoder

// Files
import 'character.dart';

void main() {
  // runApp(const MainApp());
  List charList = [];

  var excelFile = '/home/ktheart/Files/Dart_Flutter/Code/Project/Excel_Read/gbf_excel_reader/lib/Excel Sheets/Character Info.xlsx';
    var bytes = File(excelFile).readAsBytesSync();
    var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);
    for (var table in decoder.tables.keys) {  // for all sheets in excel file
      // print(table);
      // print(decoder.tables[table]!.maxCols);
      // print(decoder.tables[table]!.maxRows);
      for (var row in decoder.tables[table]!.rows) { // print contents of rows
        List character = row;

        Character gbfCharacter;
        gbfCharacter = Character(
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
        );
        charList.add(gbfCharacter);
      }
    }
  for (var gbf_char in charList) {
    gbf_char.toString();
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
