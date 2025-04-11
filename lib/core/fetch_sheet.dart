import 'dart:convert';
import 'dart:developer';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchGoogleSheetDataFromApi() async {
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

    // Converte os dados para um formato de mapa
    final List<dynamic> values = data['values'];
    if (values.isEmpty) {
      throw Exception('Nenhum dado encontrado na planilha.');
    }

    // A primeira linha é o cabeçalho (chaves do mapa)
    final List<String> headers = List<String>.from(values.first);

    // As linhas subsequentes são os valores
    final List<Map<String, dynamic>> mappedData =
        values.skip(1).map((row) {
          final List<dynamic> rowData = List<dynamic>.from(row);
          return Map<String, dynamic>.fromIterables(headers, rowData);
        }).toList();

    log(mappedData.toString(), name: "mappedData success");
    return mappedData;
  } else {
    log('Erro: ${response.statusCode}', name: "Response error");
    throw Exception('Erro ao buscar dados da planilha: ${response.statusCode}');
  }
}
