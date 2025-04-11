import 'package:get/get.dart';

import '../../../../class/personagem.dart';
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

  List<Personagem> data = [];

  Future<void> fetchGoogleSheetData() async {
    try {
      // Chama a função de fetch e processa os dados
      await fetchGoogleSheetDataFromApi().then((response) {
        if (response.isEmpty) {
          throw Exception('Nenhum dado encontrado na planilha.');
        } else {
          // Limpa a lista antes de adicionar novos dados
          data.clear();
          // Converte os dados para uma lista de Personagem
          for (Map<String, dynamic> personagem in response) {
            data.add(Personagem.fromMap(personagem));
          }
        }
      });
    } catch (e, s) {
      throw Exception('Erro ao buscar dados da planilha: $e - $s');
    }
  }
}
