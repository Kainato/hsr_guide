import 'package:get/get.dart';

import '../../../../core/fetch_sheet.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchGoogleSheetData();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  List<Map<String, String>> data = [];

  Future<void> fetchGoogleSheetData() async {
    try {
      // Chama a função de fetch e processa os dados
      final sheetData = await fetchGoogleSheetDataFromApi();
      data =
          sheetData.map<Map<String, String>>((row) {
            return {
              'name': row[0] ?? 'No Name', // Coluna 1
              'description': row[1] ?? 'No Description', // Coluna 2
            };
          }).toList();
      update(); // Atualiza o estado do controlador
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }
}
