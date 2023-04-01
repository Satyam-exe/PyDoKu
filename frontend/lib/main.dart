import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/solver/solve.dart';
import 'package:frontend/utility/sudoku/keypad.dart';
import 'package:frontend/utility/sudoku/sudoku_board.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku Solver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sudoku!"),
        ),
        body: const SudokuSolverView(),
      ),
    );
  }
}

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
                      await _showSolvedBoard();
                      debugPrint('hoe');
                    }
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Reset Board'),
                    onPressed: () {
                      debugPrint('Resetting Board');
                      setState(() {
                        _resetBoard();
                      });
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

  Future<void> _showSolvedBoard() async {
    List<List<int>> newBoard = await solveSudoku(_board);
    log('Done');
    setState(() {
      _board = newBoard;
    });
  }
}
