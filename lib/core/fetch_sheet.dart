import 'dart:convert';
import 'dart:developer';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<List<dynamic>>> fetchGoogleSheetDataFromApi() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final spreadsheetId = env['sheets_key'];
  final range = 'Characters!A:K'; // Intervalo da planilha
  final apiKey = env['api_key'];

  final url = Uri.parse(
    'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    log(data.toString(), name: "Response success"); // Log dos dados
    log(data['values'].toString(), name: "Response success"); // Log dos dados
    return List<List<dynamic>>.from(data['values']);
  } else {
    log('Erro: ${response.statusCode}', name: "Response error");
    throw Exception('Erro ao buscar dados da planilha: ${response.statusCode}');
  }
}
