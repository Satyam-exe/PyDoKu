import 'dart:convert';

import 'package:frontend/constants/api_urls.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getSolvedResponse(sudokuString) async {
  final response = await http.post(
    Uri.parse(sudokuSolveAPIUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'sudoku_str': sudokuString}),
  );
  return response;
}
