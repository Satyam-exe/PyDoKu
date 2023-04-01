import 'package:flutter/material.dart';
import 'package:frontend/utility/sudoku/keypad_cell.dart';

class KeyPad extends StatelessWidget {
  final int numRows = 2;
  final int numColumns = 5;
  final List<int> activeNumber;

  const KeyPad(this.activeNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows() {
    return List.generate(numRows, (int rowNumber) {
      return TableRow(children: _getRow(rowNumber));
    });
  }

  List<Widget> _getRow(int rowNumber) {
    return List.generate(numColumns, (int colNumber) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: KeyPadCell(
            numColumns * rowNumber + colNumber, activeNumber),
      );
    });
  }
}