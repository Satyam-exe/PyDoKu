import 'package:flutter/material.dart';

class SudokuCell extends StatefulWidget {
  final int row, col;
  final List<List<int>> board;
  final List<int> activeNumber;

  const SudokuCell(this.row, this.col, this.board, this.activeNumber, {super.key});

  @override
  State<SudokuCell> createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      enableFeedback: true,
      onTap: () {
        setState(() {
          widget.board[widget.row][widget.col] =
          widget.activeNumber[0];
        });
      },
      child: SizedBox(
        width: 30,
        height: 30,
        child: Center(
          child: Text(widget.board[widget.row][widget.col] == 0
              ? ''
              : widget
              .board[widget.row][widget.col]
              .toString()),
        ),
      ),
    );
  }
}