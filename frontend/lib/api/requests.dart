import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/constants/api_urls.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getSolvedResponse(sudokuString) async {
  final response = await http.post(
    Uri.parse(sudokuSolveAPIUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{'sudoku_str': sudokuString}),
  );
  debugPrint('Response status code: ${response.statusCode}');
  debugPrint('Response body: ${response.body}');
  return response;
}