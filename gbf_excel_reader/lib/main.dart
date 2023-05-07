// Packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart'; // flutter pub add spreadsheet_decoder

// Files
import 'character.dart';

void main() {
  // runApp(const MainApp());

  var excelFile = '/home/ktheart/Files/Dart_Flutter/Code/Project/Excel_Read/gbf_excel_reader/lib/Excel Sheets/Character Info.xlsx';
    var bytes = File(excelFile).readAsBytesSync();
    var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);
    for (var table in decoder.tables.keys) {  // for all sheets in excel file
      // print(table);
      // print(decoder.tables[table]!.maxCols);
      // print(decoder.tables[table]!.maxRows);
      for (var row in decoder.tables[table]!.rows) { // print contents of rows
        List character = row;
        var gbfCharacter = Character(
          name: character[0],
          
        );
        // String name = character[0];
        // var number = character[1] is double ? character[1].round() : character[1];
        // String rarity = character[2];
        // String element = character[3];
        // String style = character[4];
        // String race = character[5];
        // String sex = character[6];
        // var uncap =  character[7] is double ? character[7].round() : character[7];
        // var hp =  character[8] is double ? character[8].round() : character[8];
        // var atk =  character[9] is double ? character[9].round() : character[9];
        // String weapon = character[10];
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
