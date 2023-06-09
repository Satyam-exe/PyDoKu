import 'package:flutter/material.dart';
import 'package:frontend/utility/sudoku/sudoku_cell.dart';

class SudokuBoard extends StatelessWidget {
  final List<List<int>> board;
  final List<int> activeNumber;

  const SudokuBoard(this.board, this.activeNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        left: BorderSide(width: 3.0, color: Colors.black),
        top: BorderSide(width: 3.0, color: Colors.black),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows() {
    return List.generate(9, (int rowNumber) {
      return TableRow(children: _getRow(rowNumber));
    });
  }

  List<Widget> _getRow(int rowNumber) {
    return List.generate(9, (int colNumber) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: (colNumber % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: (rowNumber % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
          ),
        ),
        child: SudokuCell(rowNumber, colNumber, board, activeNumber),
      );
    });
  }
}