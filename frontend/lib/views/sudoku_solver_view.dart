import 'package:flutter/material.dart';
import 'package:frontend/solver/solve.dart';
import 'package:frontend/utility/dialogs/normal_dialog.dart';
import 'package:frontend/utility/sudoku/keypad.dart';
import 'package:frontend/utility/sudoku/sudoku_board.dart';

class SudokuSolverView extends StatefulWidget {
  const SudokuSolverView({super.key});

  @override
  State<SudokuSolverView> createState() => _SudokuSolverViewState();
}

class _SudokuSolverViewState extends State<SudokuSolverView> {
  List<int> _activeNumber = [0];

  List<List<int>> _board = List.generate(9, (_) => List.generate(9, (_) => 0));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SudokuBoard(_board, _activeNumber),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: KeyPad(_activeNumber),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Solve!'),
                    onPressed: () async {
                      bool shouldSolve = await showNormalBoolDialog(
                        context,
                        'Solve the puzzle?',
                        'Solve',
                        'Cancel',
                      );
                      if (shouldSolve) {
                        debugPrint('should solve');
                        List<List<int>>? solvedBoard =
                            await solveSudoku(_board);
                        debugPrint(solvedBoard.toString());
                        if (solvedBoard != null) {
                          setState(() {
                            _board = solvedBoard;
                          });
                        } else {
                          if (context.mounted) {
                            showNormalDialog(
                              context,
                              'The provided SuDoKu cannot be solved!',
                            );
                          }
                        }
                      } else {
                        return;
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Reset Board'),
                    onPressed: () async {
                      debugPrint('Resetting Board');
                      bool shouldReset = await showNormalBoolDialog(
                          context,
                          'Are you sure you want to reset the board?',
                          'Reset',
                          'Cancel');
                      if (shouldReset) {
                        setState(() {
                          _resetBoard();
                        });
                      } else {
                        return;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _resetBoard() {
    _board = List.generate(9, (_) => List.generate(9, (_) => 0));
    _activeNumber = [0];
  }
}
