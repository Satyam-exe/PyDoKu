import 'dart:convert';

import 'package:frontend/api/requests.dart';

String convertTableToString(List<List<int>> sudokuTable) {
  final sudokuString = sudokuTable
      .map((row) => row.map((val) => val != 0 ? val.toString() : ".").join(""))
      .join("");
  return sudokuString;
}

List<List<int>> convertStringToTable(String sudokuString) {
  final sudokuTable = List.generate(9, (i) => List.generate(9, (j) => 0));
  for (int i = 0; i < sudokuString.length; i++) {
    int rowIndex = i ~/ 9;
    int colIndex = i % 9;
    if (sudokuString[i] != ".") {
      sudokuTable[rowIndex][colIndex] = int.parse(sudokuString[i]);
    }
  }
  return sudokuTable;
}

Future<List<List<int>>> solveSudoku(List<List<int>> board) async {
  final sudokuString = convertTableToString(board);
  final response = await getSolvedResponse(sudokuString);
  final solution = jsonDecode(response.body)['solution'];
  final solvedSudokuBoard = convertStringToTable(solution);
  return solvedSudokuBoard;
}

