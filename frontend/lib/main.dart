import 'package:flutter/material.dart';
import 'package:frontend/views/sudoku_solver_view.dart';

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

